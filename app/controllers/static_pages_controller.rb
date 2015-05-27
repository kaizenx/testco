class StaticPagesController < ApplicationController
  def index
    @enquiry = Enquiry.new
  end

  def join_us
    @locations = Location.all.limit(3)
  end

  def about_us
    
  end

  def getPricing
    location_id = params[:location]
    location = Location.find(location_id)
    @pricings = location.pricings

    respond_to do |format|
      format.js 
    end
  end

  def landing
    @locations = Location.all.limit(3)
  end
end
