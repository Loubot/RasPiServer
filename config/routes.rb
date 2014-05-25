Temperature::Application.routes.draw do
  
  devise_for :users

  #devise_for :installs

  #devise_for :users

  get 'errorPage'     	=> 'temp_controller#errorPage',       	:as => 'errorPage'  

  get 'showRooms'       => 'temp_controller#showRooms',         :as => 'showRooms'

  get 'getTemp'         => 'temp_controller#getTemp',           :as => 'getTemp'

  get 'roomLogs'				=> 'temp_controller#roomLogs', 					:as => 'roomLogs'

  get 'doSheet'         => 'temp_controller#doSheet',           :as => 'doSheet'

  get 'roomsGraph'			=> 'temp_controller#roomsGraph',				:as => 'roomsGraph'

  get 'xlFile'					=> 'temp_controller#xlFile',						:as => 'xlFile'

  post 'setTemp'        => 'temp_controller#setTemp',           :as => 'setTemp'

  post 'logTemp'        => 'temp_controller#logTemp',           :as => 'logTemp'

  get 'checkOk'         => 'temp_controller#checkOk',           :as => 'checkOk'

  get 'getCurrent'      => 'temp_controller#getCurrent',        :as =>  'getCurrent'

  root :to => 'temp_controller#showRooms'
end
