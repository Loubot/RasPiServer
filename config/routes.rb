Temperature::Application.routes.draw do
  
  get 'setTempPage'     => 'temp_controller#setTempPage',       :as => 'setTempPage'  

  get 'showRooms'       => 'temp_controller#showRooms',         :as => 'showRooms'

  get 'getTemp'         => 'temp_controller#getTemp',           :as => 'getTemp'

  get 'doSheet'         => 'temp_controller#doSheet',           :as => 'doSheet'

  get 'roomLogs'				=> 'temp_controller#roomLogs', 					:as => 'roomLogs'

  get 'roomsGraph'			=> 'temp_controller#roomsGraph'					:as => 'roomsGraph'

  post 'setTemp'        => 'temp_controller#setTemp',           :as => 'setTemp'

  post 'logTemp'        => 'temp_controller#logTemp',           :as => 'logTemp'

  root :to => 'temp_controller#showRooms'
end
