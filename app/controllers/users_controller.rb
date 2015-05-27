class UsersController < AdminController
  before_action :authenticate_user!
  before_action :authorize_admin!
  before_action :find_user, only: [:edit, :update, :destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    set_flash @user.valid?
    redirect_or_render @user.valid?
  end

  def edit
  end

  def update
    @user.update(user_params)
    set_flash @user.valid?
    redirect_or_render @user.valid?
  end

  def destroy
    @user.destroy
    set_flash
    redirect_or_render
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit :email, :password, :password_confirmation, :location_id
  end
end
