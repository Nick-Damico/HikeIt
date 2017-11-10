class HikingTrailsController < ApplicationController
  def index
  	@hiking_trails = HikingTrail.all
  end

  def show
  end

  def edit
  end

  def new
  end
end
