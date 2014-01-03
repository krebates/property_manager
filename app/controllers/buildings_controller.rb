class BuildingsController < ApplicationController

  def index
    @buildings.all
  end

  def new
    @building = Building.new
  end
end
