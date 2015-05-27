class ServicesController < ApplicationController
  before_action :find_location, only: [:show, :destroy]

  def index
    @services = Service.all
    @areas = Area.all.limit(4)
    @locations = Location.all.limit(3)
  end

  def destroy
    
  end

  private

  def find_location
    @services = Service.find(params[:id])
  end

  def services_params
    params.require(:service).permit(:title, :description, :image)
  end
end
