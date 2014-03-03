module ExcelHelper

  def populateExcel()
    File.new("C:\\Users\\angell\\Desktop\\example\\file.xls", 'w')
    Spreadsheet.client_encoding = 'UTF-8'
    book = Spreadsheet::Workbook.new
    sheet1 = book.create_worksheet :name => "TempLogs"

    sheet1.row(0).concat %w{Room1 Room2 Room3 Room4}
    
    sheet1[1,10] = 'hello'
    i = 0
    (1..4).each do |x|
      j = 1
      roomData = TempLog.where(room:"room#{x}")
      roomData.each do |value|
        sheet1[j,i] = value.reading
        j += 1
      end
      i+= 1
    end

      
    
    # row = sheet1.row(1)
    # row.push 'Me bollux'

    book.write 'C:\Users\angell\Desktop\example\file.xls'
  end
end
