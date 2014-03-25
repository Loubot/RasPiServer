Temperature::Application.routes.draw do
  
  get 'errorPage'     	=> 'temp_controller#errorPage',       	:as => 'errorPage'  

  get 'showRooms'       => 'temp_controller#showRooms',         :as => 'showRooms'

  get 'getTemp'         => 'temp_controller#getTemp',           :as => 'getTemp'

  get 'doSheet'         => 'temp_controller#doSheet',           :as => 'doSheet'

  get 'roomsGraph'			=> 'temp_controller#roomsGraph',				:as => 'roomsGraph'

  get 'xlFile'					=> 'temp_controller#xlFile',						:as => 'xlFile'

  post 'setTemp'        => 'temp_controller#setTemp',           :as => 'setTemp'

  post 'logTemp'        => 'temp_controller#logTemp',           :as => 'logTemp'

  root :to => 'temp_controller#showRooms'
end
