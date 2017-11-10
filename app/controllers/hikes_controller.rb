class HikesController < ActionController::Base
	def index
		@hikes = Hike.all
	end

	def new
		@hike = Hike.new
	end
	
end