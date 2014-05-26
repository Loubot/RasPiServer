module TempControllerHelper
  def checkLogExists(no)
    room = "room#{no}"
    if SetTemp.where(room:room).exists? == false
      return 'Not set'
    else 
      temp = SetTemp.where(room:room).last      
      temp.reading
    end
  end

  def checkRoomExists(no)
    room = "room#{no}"
    if TempLog.where(room:room).exists? == false
      'No measurement recorded'
    else
      temp = TempLog.where(room:room).last
      
    end
  end

  def formatTime(timeStamp, readings)
    formattedTimes = []
    i = 0
    timeStamp.each do |time|
      formattedTime = [(time.to_i)*1000, readings[i]]
      formattedTimes << formattedTime
      i+=1
    end
    
    formattedTimes
  end

end
