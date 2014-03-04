module ExcelHelper

  def populateExcel()
    file = File.new("/home/louis/Desktop/Room_Temp_Logs.xls", 'w')
    file.close
    Spreadsheet.client_encoding = 'UTF-8'
    book = Spreadsheet::Workbook.new
    sheet1 = book.create_worksheet :name => "TempLogs"

    sheet1.row(0).concat %w{Room1 date Room2 date Room3 date  Room4 date}
    
    
    i = 0
    (1..4).each do |x|
      j = 1
      roomData = TempLog.where(room:"room#{x}")
      roomData.each do |value|
        sheet1[j,i] = value.reading
        
        i += 1
        sheet1[j,i] = value.updated_at
        j += 1
        i -=1
      end
      i+= 2
    end

      
    
    # row = sheet1.row(1)
    # row.push 'Me bollux'

    book.write '/home/louis/Desktop/Room_Temp_Logs.xls'

  end
end
