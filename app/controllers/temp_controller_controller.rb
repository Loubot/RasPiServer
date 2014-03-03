class TempControllerController < ApplicationController
  require 'spreadsheet'
  
  def getTemp
    if SetTemp.exists?(room:params[:data])
      tempObject = SetTemp.where(room:params[:data])
      render json: tempObject[0].reading
    else 
     render  :json => {:error => 'nil'}, :status => :not_found
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
  end

  def doSheet

    populateExcel()


    render json: 'ok'
  end
end
