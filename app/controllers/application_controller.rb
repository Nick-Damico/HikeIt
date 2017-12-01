class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception  
	layout :layout_by_resource
	before_action :redirect_to_home

  	def after_sign_in_path_for(resource)
  		home_path || request.env['omniauth.origin'] 
	end

	private

	def layout_by_resource
		if devise_controller?
		  "landing-login-signup"
		else
		  "application"
		end
	end

	def redirect_to_home
		redirect_to home_url if params[:action] == 'landing' && current_user
	end

end
