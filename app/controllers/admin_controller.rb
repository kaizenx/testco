class AdminController < ApplicationController

  private

  def authorize_admin!
    authorize! :manage, :all
  end

  def set_flash object_validity=true
    name = controller_name.singularize
    if object_validity
      flash[:notice] = I18n.t "#{name}.#{action_name}.success"
    else
      flash.now[:error] = I18n.t "#{name}.#{action_name}.failure"
    end
  end

  def redirect_or_render object_validity=true
    if object_validity
      redirect_to dashboard_path
    else
      if action_name == 'create'
        render :new
      elsif action_name == 'update'
        render :edit
      end
    end
  end
end
