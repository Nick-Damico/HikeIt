Rails.application.routes.draw do

  	devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  	resources :users do
  		resources :hikes, only: [:index, :show, :new]
  	end

	resources :hiking_trails

	# HikeController
	resources :hikes
	post 'hikes/:id/join', :to => 'hikes#join', :as => 'join'
	post 'hikes/:id/leave', :to => 'hikes#leave', :as => 'leave'

	get 'day_hikes', :to => 'hikes#day_hike'
	get 'overnight_hikes', :to => 'hikes#overnight_hike'

	# StaticController
	root 'static#landing'
	get '/home', :to => 'static#home'

end
