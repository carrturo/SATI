class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password, :password_confirmation, :role_id) }
  end
  
  def admin_signed_in
    if user_signed_in?
      unless current_user.role.name == "admin"
        redirect_to root_path
      end
    else
      redirect_to new_user_session_path
    end
  end
  
  def taquillero_signed_in
    if user_signed_in?
      unless current_user.role.name == "taquillero"
        redirect_to root_path
      end
    else
      redirect_to new_user_session_path
    end
  end
end
