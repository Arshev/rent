class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_up_path_for(resource)
    if resource.is_admin?
      admin_path # <- Path you want to redirect the user to after signup
    else 
      root_path
    end
  end
  def after_sign_in_path_for(resource)
    if current_user.is_admin?
      admin_path # <- Path you want to redirect the user to after signup
    else 
      root_path
    end
  end

  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :lastname])
      devise_parameter_sanitizer.permit(:account_update, keys: [:name, :lastname])
    end
end
