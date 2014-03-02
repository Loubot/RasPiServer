Temperature::Application.routes.draw do
  
  get 'room1'           =>  'temp_controller#room1',            :as => 'room1'

  get 'setTempPage'     => 'temp_controller#setTempPage',       :as => 'setTempPage'

  get 'setTemp'         => 'temp_controller#setTemp',           :as => 'setTemp'

  get 'logTemp'         => 'temp_controller#logTemp',           :as => 'logTemp'

  get 'showRooms'       => 'temp_controller#showRooms',         :as => 'showRooms'

  get 'getTemp'         => 'temp_controller#getTemp',           :as => 'getTemp'
  root :to => 'temp_controller#room1'
end
