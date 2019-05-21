module FileMigrationJobs
  class ShareHoldingMigrationJob < FileMigrationJobs::GenericFileMigrationJob
    Sheet = "Shareholder"

    EXCEL_COLUMN_TO_MODEL_ATTRIBUTE_HASH = {"Shareholder Id" => :shareholder_id, "Shareholding Date" => :share_holding_date, "Shareholder type" => :share_holder_type,
                                            "Shareholder Name" => :share_holder_name, "Total no of shares" => :total_number_of_shares, "Total amount invested" => :total_amount_invested,
                                            "Total shareholding percent" => :total_share_holding_percent}

    INSTRUMENT_TYPE_HASH = {"Equity" => :equity, "OCPS" => :ocps, "CCPS" => :ccps, "CCD" => :ccd, "OCD" => :ocd, "Warrants / RTS" => :warrants_rts}

    SHARE_HOLDER_TYPE_HASH = {"Promoter" => :promoter, "Promoter Entity" => :promoter_entity, "Angels, Family & Friends" => :angels_family_friends,
                              "ESOP Pool" => :esop_pool, "Co-founder" => :co_founder, "PE / VC" => :pe_vc, "Other Institution" => :other_institution}

    INSTRUMENT_INFO_HASH = {"Shareholder Id" => :shareholder_id, "Instrument Type" => :instrument_type, "Number of shares" => :number_of_shares, "Amount invested" => :amount_invested, "Shareholding percent" => :share_holding_percent }
                            
    attr_accessor :customer_id, :instrument

    def parse_document_and_migrate(params)
      self.customer_id = params[:customer_id]
      self.instrument = Hash.new { |k, v| k[v] = [] }

      shareholder_file = Roo::Spreadsheet.open(params[:temp_file_name])
      iterate_instrument_sheet(shareholder_file.sheet("Instrument"))
      iterate_share_holders_sheet(shareholder_file.sheet(Sheet))
      
      FileUtils.rm params[:temp_file_name], force: true
    end

    private

    def iterate_instrument_sheet(instrument_sheet)
      key_value = nil
      last_row_count = instrument_sheet.last_row
      header_row = instrument_sheet.row(1)
      it = 1
      while it < last_row_count
        it = it + 1
        current_row = instrument_sheet.row(it)
        next if current_row.blank? || current_row[0].blank? || current_row[1].blank?
        tmp = Hash.new

        current_row.each_with_index do |element, index|
          key = INSTRUMENT_INFO_HASH[header_row[index]]
          if key.blank?
            Rails.logger.info "Invalid Column name #{header_row[index]} mapped."
            next
          elsif key == :shareholder_id
            key_value = element
            next
          elsif key == :instrument_type
            element = INSTRUMENT_TYPE_HASH[element]
          end
          tmp[key] = element
        end
        i = self.instrument[key_value].count
        self.instrument[key_value][i] = tmp
      end 
    end

    def iterate_share_holders_sheet(shareholders_sheet)
      it = 0
      last_row_count = shareholders_sheet.last_row
      while it < last_row_count
        it = it + 1
        current_row = shareholders_sheet.row(it)
        next if current_row.blank? || current_row[0].blank? || current_row[1].blank?
            iterate_row_by_row_sheet(shareholders_sheet, it, current_row)
          return
      end
      
    end

    def iterate_row_by_row_sheet(shareholders_sheet, row_index, header_row)
      it = row_index
      share_holder_hash = Hash.new { |k, v| k[v] = [] }
      while it < shareholders_sheet.last_row
          it = it + 1
          curr_row = shareholders_sheet.row(it)
          next if curr_row.blank? || curr_row[0].blank?
          store_share_holders_into_hash(share_holder_hash, curr_row, header_row)
      end
      migrate_share_holding_patterns(share_holder_hash)
    end

    def store_share_holders_into_hash(share_holder_hash, current_row, header_row)
      
      date = nil
      tmp = Hash.new
      current_row.each_with_index do |element,index|
          key = EXCEL_COLUMN_TO_MODEL_ATTRIBUTE_HASH[header_row[index]]
        if key.blank?
          Rails.logger.info "Invalid Column name #{header_row[index]} mapped."
          next
        elsif key == :share_holder_type
          element = SHARE_HOLDER_TYPE_HASH[element]
        elsif key == :share_holding_date
            date = element
          next
        end
        tmp[key] = element
      end
      i = share_holder_hash[date].count
        share_holder_hash[date][i] = tmp 
    end

    def migrate_share_holding_patterns(share_holder_hash)
      share_holder_hash.each do |date, shareholders|
        shareholdingpattern = set_share_holding_pattern(date)
        shareholders.each do |share_holder|
          shareholder_id = share_holder[:shareholder_id]
          share_holder.tap{|k| k.delete(:shareholder_id)}
          shareholder = ShareHolder.new(share_holder)
          if self.instrument[shareholder_id]
            self.instrument[shareholder_id].each do |instrument_detail|  
              instrument_entry = set_instrument_details(instrument_detail) 
              shareholder.instrument_details << instrument_entry if instrument_entry
            end
          end
          shareholdingpattern.share_holders << shareholder
        end
        shareholdingpattern.save
      end
    end

    def set_share_holding_pattern(date)
      tmp = {:date => date, :customer_id => self.customer_id}
      ShareHoldingPattern.new(tmp)  
    end

    def set_instrument_details(instrument_detail)
      InstrumentDetail.new(instrument_detail)   
    end

  end
end
