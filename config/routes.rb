Rails.application.routes.draw do
  get 'users/show'

  	devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  	resources :users do
  		resources :hikes, only: [:index, :show, :new]
  	end

	resources :hiking_trails

	# HikeController
	resources :hikes
	post 'hikes/:id/join', :to => 'hikes#join', :as => 'join'
	post 'hikes/:id/leave', :to => 'hikes#leave', :as => 'leave'

	# StaticController
	root 'static#landing'
	get 'home', :to => 'static#home', :as => 'static_home'

end
