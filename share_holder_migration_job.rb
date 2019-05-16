module FileMigrationJobs
    class ShareHolderMigrationJob < FileMigrationJobs::GenericFileMigrationJob
        Sheet = "Shareholder"

        EXCEL_COLUMN_TO_MODEL_ATTRIBUTE_HASH = { "Shareholding Date" => :shareholding_date, "Shareholder type" => :shareholder_type,
        "Shareholder Name" => :shareholder_name, "Total no of shares" => :total_no_of_shares, "Total amount invested" => :total_amt_invested,
        "Total shareholding percent" => :total_shareholding_percent, "Type of shares" => :types_of_shares }

        Instrument_type_hash = {"Equity" => :equity, "Ocps" => :ocps, "Ccps" => :ccps, "Ccd" => :ccd, "Ocd" => :ocd, "Warrant" => :warrant}

        attr_accessor :attribute_shareholder_index, :customer_id, :share_holder_hash

        def initialize
            self.share_holder_hash = Hash.new{ |k,v| k[v] = [] }
            self.attribute_shareholder_index = Hash.new
        end

        def parse_document_and_migrate(params)
            self.customer_id = params[:customer_id]
            shareholder_file = Roo::Spreadsheet.open(params[:temp_file_name]) 
            find_index(shareholder_file.sheet(Sheet))
            iterate_share_holder_sheet(shareholder_file.sheet(Sheet))            
            
           # FileUtils.rm params[:temp_file_name], force: true
        end

    private
        def iterate_share_holder_sheet(shareholder_sheet)
            it = 1
            last_row_count = shareholder_sheet.last_row
            while it < last_row_count
                 	 it = it + 1
                    current_row = shareholder_sheet.row(it)
                    next if current_row.blank? || current_row[0].blank?  
                                     
                    self.share_holder_hash["#{current_row[self.attribute_shareholder_index["Shareholding Date"]]}"] << current_row        
            end
            migrate_shareholders_hash()
        end

        def migrate_shareholders_hash()
            self.share_holder_hash.each do |key, value|
                shareholding_pattern = ShareHoldingPattern.new
                shareholding_pattern.date = key
                shareholding_pattern.customer_id = self.customer_id
                save_share_holders(shareholding_pattern, key)
            end
        end

        def save_share_holders(shareholding_pattern, kkey)
            i=0
            while i < self.share_holder_hash[kkey].count do           
                share_holder_entry = set_share_holder(kkey, i)
                 i = i + 1
             shareholding_pattern.share_holders << share_holder_entry
            end
            shareholding_pattern.save
        end

        def set_share_holder(kkey, i)
            share_holder_entry = ShareHolder.new
   
            share_holder_entry.share_holder_name = self.share_holder_hash[kkey][i][self.attribute_shareholder_index["Shareholder Name"]]
            share_holder_entry.share_holder_type = self.share_holder_hash[kkey][i][self.attribute_shareholder_index["Shareholder type"]]
            share_holder_entry.total_number_of_shares = self.share_holder_hash[kkey][i][self.attribute_shareholder_index["Total no of shares"]]
            share_holder_entry.total_amount_invested = self.share_holder_hash[kkey][i][self.attribute_shareholder_index["Total amount invested"]]
            share_holder_entry.total_share_holding_percent = self.share_holder_hash[kkey][i][self.attribute_shareholder_index["Total shareholding percent"]]
            if self.attribute_shareholder_index["Type of shares"]
            tmp = self.share_holder_hash[kkey][i][self.attribute_shareholder_index["Type of shares"]]
            else tmp = nil
            end
            instrument =  set_instrument_details(Instrument_type_hash[tmp])   if tmp
            share_holder_entry.instrument_details << instrument       if tmp
            share_holder_entry
        end

        def set_instrument_details(instrument_type)
            instrument = InstrumentDetail.new
            instrument.instrument_type = instrument_type
            instrument  
        end

        def find_index(sheet_name)
            excel_attribute = sheet_name.row(1)
             excel_attribute.each_with_index do |element, index|
              if EXCEL_COLUMN_TO_MODEL_ATTRIBUTE_HASH["#{element}"]
                self.attribute_shareholder_index["#{element}"] = index
              end
            end
        end

    end
end
