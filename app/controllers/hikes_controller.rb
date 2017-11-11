class HikesController < ApplicationController
	#Before_action defined in ApplicationController
	before_action :find_hike, only: [:show, :edit]
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
					:hiking_trail_id
				)
		end

		def find_hike
			@hike = Hike.find_by(by: params[:id])
		end
		
end