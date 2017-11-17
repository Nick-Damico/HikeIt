class StaticController < ApplicationController

  def home
  	render :layout => 'application'
  end

  def landing
  	render :layout => 'landing-login-signup'
  end

end
