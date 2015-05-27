class LocationsController < AdminController
  before_action :authenticate_user!, except: [:show, :index]
  before_action :authorize_admin!, except: [:show, :index]
  before_action :find_location, only: [:show, :edit, :update, :destroy]

  def index
    @locations = Location.all
  end

  def new
    @location = Location.new
  end

  def create
    @location = Location.create(location_params)
    set_flash @location.valid?
    redirect_or_render @location.valid?
  end

  def show
    @services = @location.available_services.all
    @areas = @location.available_areas.all
    @events = @location.events.limit(3).order(created_at: :desc)
    starter_pricing = @location.available_pricings.joins(:pricing).order("pricings.price DESC").first
    @starter_pricing = "#{starter_pricing.pricing.currency} #{starter_pricing.pricing.price}"
    @pricings_top = @location.pricings.limit(3).order(price: :desc)
    @pricings_bottom = @location.pricings.limit(2).order(price: :asc)
    @locations = Location.where.not(id: @location.id).limit(3)
  end

  def edit
  end

  def update
    @location.update(location_params)
    set_flash @location.valid?
    respond_to do |format|
      format.html { redirect_or_render @location.valid? }
      format.js
    end
  end

  def destroy
    @location.destroy
    set_flash
    redirect_or_render
  end

  private

  def find_location
    @location = Location.find(params[:id])
  end

  def location_params
    params.require(:location).permit(
      :name,
      :city,
      :address,
      :image,
      :description,
      :service_title,
      :service_description,
      :mentor_title,
      :mentor_description,
      :company_title,
      :company_description,
      :map_title,
      :map_description,
      :map_embed
    )
  end
end
