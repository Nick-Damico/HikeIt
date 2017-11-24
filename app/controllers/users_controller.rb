class UsersController < ApplicationController
	before_action :authenticate_user!
  before_action :authenticate_profile_owner, only: [:edit]

  def show
  	@user = User.find_by(id: params[:id])
  	if @user.nil?
  		redirect_to hikes_path
  	end
  end

  def edit
  	@user = User.find_by(id: params[:id])
  end

  def update
  	@user = User.find_by(id: params[:id])
  	if @user.update(user_params)
  		redirect_to user_path(@user), notice: "profile updated"
  	else
  		render :show
  	end

  end


  private 
  def user_params
  	params.require(:user).permit(
  		:trail_name,
  		:bio,
  		:profile_image
  		)
  end

  def authenticate_profile_owner
    if current_user != User.find_by(id: params[:id])
      redirect_to hikes_path, alert: "task not available"
    end
  end
end
