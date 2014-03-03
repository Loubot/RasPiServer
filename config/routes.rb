Temperature::Application.routes.draw do
  
  get 'setTempPage'     => 'temp_controller#setTempPage',       :as => 'setTempPage'  

  get 'showRooms'       => 'temp_controller#showRooms',         :as => 'showRooms'

  get 'getTemp'         => 'temp_controller#getTemp',           :as => 'getTemp'

  post 'setTemp'        => 'temp_controller#setTemp',           :as => 'setTemp'

  post 'logTemp'        => 'temp_controller#logTemp',           :as => 'logTemp'
  root :to => 'temp_controller#showRooms'
end
