class BuildingsController < ApplicationController

  def index
    @buildings = Building.all
  end

  def new
    @building = Building.new
    @buildings = Building.find(:all)
  end

  def create
    @building = Building.new(building_params)
      if @building.save
        redirect_to buildings_path
      else
        render :new
      end
  end

  def edit
    @building = Building.find(params[:id])
  end

  def update
    @building = Building.find(param[:id])
    @building.update_attributes!(building_params)
    redirect_to buildings_path
  end

  def destroy
    @building = Building.find_by_id(params[:id])
      if @building.destroy
        redirect_to buildings_path
      end
  end

  def show
    @building = Building.find(params[:id])
  end

  private

  def building_params
    params.require(:building).permit(:street_address, :city, :state, :zip_code, :description, :owner_id)
  end
end
