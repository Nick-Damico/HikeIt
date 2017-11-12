class HikesController < ApplicationController
	before_action :find_hike, only: [:show, :edit, :update]
	before_action :authenticate_user!, :except => [:show, :index]
	before_action :authenticate_for_edit, only: [:update]
	def index
		@hikes = Hike.all
	end

	def new		
		@hike = Hike.new
	end

	def show

	end

	def edit	

		
	end

	def update	
	binding.pry	
		if @hike.update(hike_params)
			redirect_to hike_path(@hike)
		else
			render :show
		end
	end
	
	def create
		@hike = Hike.new(hike_params)
		if @hike.save
			redirect_to hike_path(@hike.id)
		else
			render :new
		end
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
		
end