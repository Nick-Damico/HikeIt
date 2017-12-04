Rails.application.routes.draw do

  	devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  	resources :users do
  		resources :hikes, only: [:index, :show, :new, :create]
  	end

	resources :hiking_trails

	# HikeController
	resources :hikes do
		collection do
			get 'day_hikes', :to => 'hikes#day_hike'
			get 'overnight_hikes', :to => 'hikes#overnight_hike'
		end
	end

	post 'hikes/:id/join', :to => 'hikes#join', :as => 'join'
	post 'hikes/:id/leave', :to => 'hikes#leave', :as => 'leave'

	

	# StaticController
	root 'static#landing'
	get '/home', :to => 'static#home'

end
