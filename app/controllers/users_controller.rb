class UsersController < ApplicationController
	before_action :authenticate_user!
  before_action :authenticate_profile_owner, only: [:edit]
  before_action :get_user, only: [:show, :edit, :update]

  def show
  	if @user.nil?
  		redirect_to hikes_path
  	end
  end

  def edit
  end

  def update
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

  def get_user
    @user = User.find_by(id: params[:id])
  end
end
