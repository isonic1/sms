require 'settings'
require 'google_drive'
require 'google_text'

class GoogleDocs
    
  def getData(column_num)
    session = GoogleDrive.login($guser, $gpass)
    @ws = session.spreadsheet_by_key($gkey).worksheets[$work_sheet]
  
    row = 1
    col = column_num
    data = []
    col_data = @ws[row, col].to_s
     until col_data.empty? == true do
       col_data = @ws[row, col].to_s
       row = row + 1
       data << col_data.to_s
       data.delete("")
     end
    data
  end

end


RSpec.configure do |config|
  
  config.before :each do 
 
    GoogleText.configure do |config|
        config.email        = $guser
        config.password     = $gpass
    end    
  end

end
