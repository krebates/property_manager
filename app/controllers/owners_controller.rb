class OwnersController < ApplicationController

  def index
    @owners = Owner.all
  end

  def new
    @owner = Owner.new
  end

  def create
    @owner = Owner.new(owner_params)
      if @owner.save
        redirect_to owners_path
      else
        render :new
      end
  end

  def edit
    @owner = Owner.find(params[:id])
  end

  def update
    @owner = Owner.find(params[:id])
    @owner.update_attributes!(owner_params)
    redirect_to owners_path
  end

  def destroy
    @owner = Owner.find_by_id(params[:id])
      if @owner.destroy
        redirect_to owners_path
      end
  end

  def show
    @owner = Owner.find(params[:id])
  end

  private

  def owner_params
    params.require(:owner).permit(:first_name, :last_name, :email, :company)
  end
end
