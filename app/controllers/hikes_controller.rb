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
		respond_to do |format|
			format.html
			format.json { render json: @hikes, status: 200 }
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
		if @hike.save
			@hike.planned_hikes_attributes=(params[:hike][:planned_hikes_attributes])
			redirect_to hike_path(@hike.id), notice: "Hike successfully created!"
		else
			render :new
		end
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
			@hike.planned_hikes_attributes=(params[:hike][:planned_hikes_attributes])
			redirect_to hike_path(@hike)
		else
			render :edit
		end
	end

	def destroy
   		@hike.destroy
    	redirect_to home_path, notice: "You Deleted Hike: #{@hike.title}."
 	end

 	def day_hike
 		@hikes = Hike.get_day_hikes

 		render :index
 	end

 	def overnight_hike
 		@hikes = Hike.get_overnight_hikes
 		render :index
 	end


 	def join
		redirect_to hike_path(@hike), notice: @hike.join_or_leave_hike(current_user)
	end

	def leave
		redirect_to hikes_path, notice: @hike.join_or_leave_hike(current_user)
	end

	private
		def hike_params
			params.require(:hike).permit(
					:user_id,
					:title,
					:description,
					:hike_date,
					:hike_time,
					:notes,
					:private,
					:leader_id,
					:hiking_trail_id,
					:hiking_trail_attributes => [:name, :location, :area, :distance, :feature_id],
				)
		end

		def find_hike
			@hike = Hike.find_by(id: params[:id])
		end

		def authenticate_as_leader
  			redirect_to root_path if @hike.leader_id != current_user.id
  		end

end
