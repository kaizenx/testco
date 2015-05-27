class EventsController < AdminController
  before_action :authenticate_user!, except: [:show, :index]
  before_action :authorize_admin!, except: [:show, :index]
  before_action :find_event, only: [:edit, :update, :destroy]

  def index
    start_date = DateTime.now.beginning_of_month
    end_date = DateTime.now.end_of_month
    @events = Event.between(start_date, end_date).order(date: :desc)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @events }
    end
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.create(event_params)
    set_flash @event.valid?
    redirect_or_render @event.valid?
  end

  def show
    @event = Event.find(params[:id])
  end

  def edit
  end

  def update
    @event.update(event_params)
    set_flash @event.valid?
    redirect_or_render @event.valid?
  end

  def destroy
    @event.destroy
    set_flash
    redirect_or_render
  end

  private

  def find_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit :title, :location_id, :date, :image, :description
  end
end
