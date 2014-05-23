class TempControllerController < ApplicationController
  require 'spreadsheet'
  before_action :authenticate_user!
  def getTemp
    if SetTemp.exists?(room:params[:data])
      tempObject = SetTemp.where(room:params[:data])
      render json: tempObject[0].reading
    else 
     render  :json => {:error => 'nil'}, :status => 404
    end    
  end

  def checkOk
    render json: 'ok'
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
    
    TempLog.create(room:roomNo, reading: roomData[1].to_f)
    
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
    roomRecords1 = TempLog.where(room: 'room1').pluck(:reading).collect { |x| x.to_f }
    roomRecords2 = TempLog.where(room: 'room2').pluck(:reading).collect { |x| x.to_f }
    roomRecords3 = TempLog.where(room: 'room3').pluck(:reading).collect { |x| x.to_f }
    roomRecords4 = TempLog.where(room: 'room4').pluck(:reading).collect { |x| x.to_f }
    roomRecords5 = TempLog.where(room: 'room5').pluck(:reading).collect { |x| x.to_f }
    @timeRecords1 = TempLog.where(room: 'room1').pluck(:updated_at)
    @timeRecords2 = TempLog.where(room: 'room2').pluck(:updated_at)
    @timeRecords3 = TempLog.where(room: 'room3').pluck(:updated_at)
    @timeRecords4 = TempLog.where(room: 'room4').pluck(:updated_at)
    @timeRecords5 = TempLog.where(room: 'room5').pluck(:updated_at)
    gon.roomRecords1= formatTime(@timeRecords1, roomRecords1)
    gon.roomRecords2 = formatTime(@timeRecords2, roomRecords2)
    gon.roomRecords3 = formatTime(@timeRecords3, roomRecords3)
    gon.roomRecords4 = formatTime(@timeRecords4, roomRecords4)
    gon.roomRecords5 = formatTime(@timeRecords5, roomRecords5)
    
    
  end

  def doSheet

    populateExcel()

    UserMailer.sendLogs().deliver
    render json: 'ok'
  end

  def xlFile
    begin
      # send_file '/home/louis/Desktop/Room_Temp_Logs.xls'
      populateExcel()
      send_file Rails.root.join('excel/Room_Temp_Logs.xls')
    rescue Exception => e
      flash[:danger] = 'Could not find file'
      redirect_to :back
    end
    

  end

end
