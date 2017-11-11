class HikingTrailsController < ApplicationController
  def index
  	@hiking_trails = HikingTrail.all
  end

  def show
    @hiking_trail = HikingTrail.find_by(id: params[:id])
  end

  def edit
  end

  def new
  	@hiking_trail = HikingTrail.new
  end

  def create
  	@hiking_trail = HikingTrail.new(hiking_trail_params)
    if @hiking_trail.save
      redirect_to hiking_trail_url(@hiking_trail)
    else
      render :new
    end
  end

  private
  def hiking_trail_params
  	params.require(:hiking_trail).permit(
  			:name,
  			:location,
  			:area,
  			:distance,
  			:elevation_gain,
  			:difficulty_rating,
  			:feature_id
  		)
  end
end
