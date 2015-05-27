class PricingsController < ApplicationController
  before_action :set_location
  before_action :set_pricing, only: [:edit, :destroy, :update]

  def new
    @pricing = @location.pricings.new
  end

  def edit
  end

  def create
    @pricing = @location.pricings.new(pricing_params)
    if @pricing.save
      redirect_to dashboard_path
    else
      render :new
    end
  end

  def destroy
    @pricing.destroy
    redirect_to :back
  end

  def update
     if @pricing.update(pricing_params)
      redirect_to dashboard_path
    else
      render :edit
    end
   end

  private

  def set_pricing
    @pricing = @location.pricings.find(params[:id])
  end

  def set_location
    @location = Location.find(params[:location_id])
  end

  def pricing_params
    params.require(:pricing).permit(:name, :price, :currency, :period, :public)
  end
end
