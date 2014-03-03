class TempControllerController < ApplicationController

  def room1
    @temp = SetTemp.where(room: 'room1')
    respond_to do |format|
      format.html
      format.json { render json: @temp[0].reading }
    end
  end

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
    @room1Current= TempLog.where(room:'room1').last
    @room2Current= TempLog.where(room:'room2').last
    @room3Current= TempLog.where(room:'room3').last
    @room4Current= TempLog.where(room:'room4').last
    @room1Temp = SetTemp.where(room:'room1')
    @room2Temp = SetTemp.where(room:'room2')
    @room3Temp = SetTemp.where(room:'room3')
    @room4Temp = SetTemp.where(room:'room4')
  end
end
