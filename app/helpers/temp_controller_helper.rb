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
      temp.reading
    end
  end

  def formatTime(timeStamp)
    formattedTimes = []

    timeStamp.each do |time|
      formattedTime = time.strftime("%Y %e %d %H:%M")
      formattedTimes << formattedTime
    end
    formattedTimes
  end

end
