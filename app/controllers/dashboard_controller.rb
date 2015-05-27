class DashboardController < AdminController
  before_action :authenticate_user!
  before_action :authorize_admin!

  def index
    @locations  = Location.all
    @users      = User.all
    @news       = News.all
    @events     = Event.all
    @mentors    = Mentor.all
    @pricings   = Pricing.all
    @companies  = Company.all
  end
end
