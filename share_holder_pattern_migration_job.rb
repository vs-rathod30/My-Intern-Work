module FileMigrationJobs
    class ShareHolderPatternMigrationJob < FileMigrationJobs::GenericFileMigrationJob

        attr_accessor :shareholder_hash
    
            def initialize
                self.shareholder_hash = Hash.new{|hsh, key| hsh[key] = []}
            end
    
            def create_share_holder_pattern_record
             shareholder_excel = Roo::Spreadsheet.open('./shareholding_template - WHFL.xlsx')
             
             iterate_every_sheet(shareholder_excel)
             #whfl.count
             @share_holder_pattern = ShareHoldingPattern.new
             self.shareholder_hash.each do |key, value|
                 
                  @share_holder_pattern.date = key
                 info_share_holder( @share_holder_pattern, key)
             end
              @share_holder_pattern
            end
    
        private
    
            def iterate_every_sheet(shareholder_sheet)
                it = 1
                 last_row_count = shareholder_sheet.last_row
                 while it < last_row_count
                    it = it + 1
                     current_row = shareholder_sheet.row(it)
                     self.shareholder_hash["#{current_row[2]}"] << current_row
                end
            end
    
            def info_share_holder( share_holder_pattern, dATE)
                #byebug
              i=0
             while i < self.shareholder_hash[dATE].count do
                share_holder_entry = ShareHolder.new
               
                share_holder_entry.share_holder_name = self.shareholder_hash[dATE][i][4]
                share_holder_entry.share_holder_type = self.shareholder_hash[dATE][i][3]
                share_holder_entry.total_number_of_shares = self.shareholder_hash[dATE][i][5]
                share_holder_entry.total_amount_invested = self.shareholder_hash[dATE][i][6]
                share_holder_entry.total_share_holding_percent = self.shareholder_hash[dATE][i][7]
               
                i=i+1
                share_holder_pattern.share_holders << share_holder_entry
                #have to create share holder pattern instance global
                end
            end
        end  
    end
