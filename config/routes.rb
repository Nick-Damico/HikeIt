Rails.application.routes.draw do
  devise_for :users
# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

# StaticController
  root 'static#home'

  get 'static/home'

  get 'static/about'

  get 'static/contact'

# HikeController

end
