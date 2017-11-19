class HikingTrailsController < ApplicationController
  before_action :find_hiking_trail, :only => [:show, :edit]
  before_action :authenticate_user!, :except => [:show, :index]

  def index
  	@hiking_trails = HikingTrail.all
  end

  def show  
  
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


  def edit
  end

  def update  
    if @hiking_trail.update(hiking_trail_params)
      redirect_to hiking_trail_path(@hiking_trail)
    else
      render :edit
    end
  end

  def destroy
      @hiking_trail.destroy
      redirect_to root_path
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
  			:feature_id,
        :feature_attributes => [:title]
  		)
  end

  def find_hiking_trail
    @hiking_trail = HikingTrail.find_by(id: params[:id])
  end
end
