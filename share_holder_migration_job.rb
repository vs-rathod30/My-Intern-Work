module FileMigrationJobs
  class ShareHoldingMigrationJob < FileMigrationJobs::GenericFileMigrationJob
    Sheet = "Shareholder"

    EXCEL_COLUMN_TO_MODEL_ATTRIBUTE_HASH = {"Shareholding Date" => :share_holding_date, "Shareholder type" => :share_holder_type,
                                            "Shareholder Name" => :share_holder_name, "Total no of shares" => :total_number_of_shares, "Total amount invested" => :total_amount_invested,
                                            "Total shareholding percent" => :total_share_holding_percent, "Type of shares" => :type_of_shares}

    INSTRUMENT_TYPE_HASH = {"Equity" => :equity, "Ocps" => :ocps, "Ccps" => :ccps, "Ccd" => :ccd, "Ocd" => :ocd, "Warrant" => :warrant}

    SHARE_HOLDER_TYPE_HASH = {"Promoter" => :promoter, "Promoter Entity" => :promoter_entity, "Angels, Family & Friends" => :angels_family_friends,
                              "ESOP Pool" => :esop_pool, "Co-founder" => :co_founder, "PE / VC" => :pe_vc, "Other Institution" => :other_institution}

    attr_accessor :customer_id, :share_holder_hash

    def initialize
      self.share_holder_hash = Hash.new { |k, v| k[v] = [] }
    end

    def parse_document_and_migrate(params)
      self.customer_id = params[:customer_id]
      shareholder_file = Roo::Spreadsheet.open(params[:temp_file_name])
      iterate_share_holders_sheet(shareholder_file.sheet(Sheet))
      migrate_share_holding_patterns()
      share_holder_hash.clear
       FileUtils.rm params[:temp_file_name], force: true
    end

    private

    def iterate_share_holders_sheet(shareholders_sheet)
      it = 1
      last_row_count = shareholders_sheet.last_row
      while it < last_row_count
        current_row = shareholders_sheet.row(it)
        next if current_row.blank? || current_row[0].blank? || current_row[1].blank?
            iterate_row_by_row_sheet(shareholders_sheet, it, current_row)
          return
        it = it + 1
      end
      
    end

    def iterate_row_by_row_sheet(shareholders_sheet, row_index, header_row)
      it = row_index
      while it < shareholders_sheet.last_row
          it = it + 1
          curr_row = shareholders_sheet.row(it)
          next if curr_row.blank? || curr_row[0].blank?
          store_share_holders_into_hash(curr_row, header_row)
      end
    end

    def store_share_holders_into_hash(current_row, header_row)
      date = nil
      tmp = Hash.new
      current_row.each_with_index do |element,index|
          key = EXCEL_COLUMN_TO_MODEL_ATTRIBUTE_HASH[header_row[index]]
        if key.blank?
          Rails.logger.info "Invalid Column name #{header_row[index]} mapped."
          next
        elsif key == :type_of_shares
          element = INSTRUMENT_TYPE_HASH[element]
        elsif key == :share_holder_type
          element = SHARE_HOLDER_TYPE_HASH[element]
        elsif key == :share_holding_date
            date = element
          next
        end
        tmp[key] = element
      end
      i = self.share_holder_hash[date].count
        self.share_holder_hash[date][i] = tmp 
    end

    def migrate_share_holding_patterns
   
      self.share_holder_hash.each do |key, value|
        shareholdingpattern = set_share_holding_pattern(key)

        value.each do |data|
              instrument = set_instrument_details(data) if data[:type_of_shares]
              data.tap{|k| k.delete(:type_of_shares)} 
          
          shareholder = ShareHolder.new(data)
          shareholder.instrument_details << instrument if instrument
          shareholdingpattern.share_holders << shareholder
        end
        shareholdingpattern.save
      end
    end

    def set_share_holding_pattern(date)
        shareholdingpattern = ShareHoldingPattern.new
        shareholdingpattern.date = date
        shareholdingpattern.customer_id = self.customer_id
        shareholdingpattern
    end

    def set_instrument_details(data)
        instrument = InstrumentDetail.new
        instrument.instrument_type = data[:type_of_shares] 
        instrument   
    end

  end
end
