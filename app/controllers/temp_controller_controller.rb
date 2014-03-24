class TempControllerController < ApplicationController
  require 'spreadsheet'
  
  def getTemp
    if SetTemp.exists?(room:params[:data])
      tempObject = SetTemp.where(room:params[:data])
      render json: tempObject[0].reading
    else 
     render  :json => {:error => 'nil'}, :status => 404
    end    
  end

  def setTempPage

  end

  def setTemp
    roomData = params[:data]
    roomNo = 'room' + roomData[0]
    if SetTemp.where(room:roomNo) == []
      @newTemp = SetTemp.create(room:roomNo, reading: roomData[1])
    else
      @newTemp = SetTemp.where(room:roomNo).update_all(reading: roomData[1])
    end
    flash[:success] = params[:room]
    respond_to do |format|
      format.html
      format.json { render json: @newTemp }
    end
  end

  def logTemp
    roomData = params[:data]
    roomNo = 'room' + roomData[0]
    
    TempLog.create(room:roomNo, reading: roomData[1])
    
    flash[:success] = params[:room]
    respond_to do |format|
      
      format.json { render json: 'done' }
    end
  end

  def showRooms
    @room1Temp = checkLogExists(1)
    @room2Temp = checkLogExists(2)
    @room3Temp = checkLogExists(3)
    @room4Temp = checkLogExists(4)
    
    @room1Current = checkRoomExists(1)
    @room2Current = checkRoomExists(2)
    @room3Current = checkRoomExists(3)
    @room4Current = checkRoomExists(4)
    @room5Current = checkRoomExists(5)
  end

  def roomLogs
    @roomNo = params[:room]
    @roomRecords = TempLog.where(room: "room#{@roomNo}")    
    
  end

  def roomsGraph
    gon.roomRecords1 = TempLog.where(room: 'room1').pluck(:reading)
    gon.roomRecords2 = TempLog.where(room: 'room2').pluck(:reading)
    gon.roomRecords3 = TempLog.where(room: 'room3').pluck(:reading)
    gon.roomRecords4 = TempLog.where(room: 'room4').pluck(:reading)
    @timeRecords1 = TempLog.where(room: 'room1').pluck(:updated_at)
    formattedTimes = formatTime(@timeRecords1)
    gon.timeRecords1 = formattedTimes
    
  end

  def doSheet

    populateExcel()

    UserMailer.sendLogs().deliver
    render json: 'ok'
  end


end
