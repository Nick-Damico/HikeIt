class HikesController < ApplicationController
	before_action :find_hike, only: [:show, :edit, :update, :join, :leave]
	before_action :authenticate_user!, :except => [:show, :index]
	before_action :authenticate_as_leader, only: [:edit, :update]

	def index
		if params[:user_id]
			@hikes = User.find(params[:user_id]).hikes
			if hikes_lead = Hike.all.find_by(leader_id: params[:user_id])
				@hikes <<  hikes_lead 
			end
		else
			@hikes = Hike.all
		end		
	end

	def new		
		@hike = Hike.new
	end

	def join
		if !@hike.users.include?(current_user)
				@hike.users << current_user
				flash[:notice] = "You've joined #{@hike.title}."
		end
		redirect_to users_show_path
	end

	def leave
		if @hike.users.include?(current_user)
			 @hike.users.delete(current_user)
			 flash[:notice] = "You've left planned hike #{@hike.title}."
		end
		redirect_to hikes_path
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
	
	def create
		@hike = Hike.new(hike_params)
		@hike.hiking_trail = HikingTrail.find_or_create_by(id: params[:hike][:hiking_trail_id]) if @hike.hiking_trail_id.nil?
		if @hike.save
			redirect_to hike_path(@hike.id)
		else
			render :new
		end
	end

	def destroy
   		@hike.destroy
    	redirect_to root_path
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