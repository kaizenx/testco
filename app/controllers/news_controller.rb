class NewsController < AdminController
  before_action :authenticate_user!
  before_action :authorize_admin!
  before_action :find_news, only: [:edit, :update, :destroy]

  def new
    @news = News.new
  end

  def create
    @news = News.create(news_params)
    set_flash @news.valid?
    redirect_or_render @news.valid?
  end

  def edit
  end

  def update
    @news.update(news_params)
    set_flash @news.valid?
    redirect_or_render @news.valid?
  end

  def destroy
    @news.destroy
    set_flash @news.valid?
    redirect_or_render @news.valid?
  end

  private

  def find_news
    @news = News.find(params[:id])
  end

  def news_params
    params.require(:news).permit :title, :content
  end
end
