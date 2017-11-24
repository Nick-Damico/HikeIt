class HikesController < ApplicationController
	before_action :find_hike, only: [:show, :edit, :update, :join, :leave, :destroy]
	before_action :authenticate_user!
	before_action :authenticate_as_leader, only: [:edit, :update]

	def index
		if params[:user_id] && @hikes = User.find_by(id: params[:user_id]).hikes
			@hikes			
		else
			@hikes = Hike.all
		end		
	end

	def new
		if @user = User.find_by(id: params[:user_id])			
			@hike = @user.hikes.build(leader_id: @user.id)
		else
			@hike = Hike.new
		end
	end

	def create
		@hike = Hike.new(hike_params)	
		@hike.find_or_add_leader(current_user)
		if @hike.save
			@hike.users.push(current_user)
			redirect_to hike_path(@hike.id), notice: "Hike successfully created!"
		else
			render :new
		end
	end

	def join
		redirect_to hike_path(@hike), notice: @hike.join_or_leave_hike(current_user)
	end

	def leave
		redirect_to hikes_path, notice: @hike.join_or_leave_hike(current_user)
	end

	def show
		if params[:user_id]
			@user = User.find_by(id: params[:user_id])
			@hike = @user.hikes.find_by(id: params[:id]) 
			if @hike.nil?
				redirect_to user_hikes_path(@user), alert: "Hike not found"
			end
		end
	end

	def edit	
	end

	def update	
		if @hike.update(hike_params)
			redirect_to hike_path(@hike)
		else
			render :edit
		end
	end

	def destroy
   		@hike.destroy
    	redirect_to static_home_path
 	end

	private	
		def hike_params
			params.require(:hike).permit(
					:title,
					:description,
					:hike_date,
					:hike_time,
					:notes,
					:leader_id,
					:hiking_trail_id,
					:hiking_trail_attributes => [:name, :location, :area, :distance, :feature_id]
				)
		end

		def find_hike
			@hike = Hike.find_by(id: params[:id])
		end

		def authenticate_as_leader
  			redirect_to root_path if @hike.leader_id != current_user.id  				
  		end
		
end