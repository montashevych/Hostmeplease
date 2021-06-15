class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  # Checks if user is log in.
  def logged_in_user
    return if user_signed_in?

    flash[:danger] = 'Please log in'
    redirect_to new_user_session_path
  end

  protected

  def configure_permitted_parameters
    attributes = [:first_name, :last_name, :role, :email, :avatar]
    devise_parameter_sanitizer.permit(:sign_up, keys: attributes)
    devise_parameter_sanitizer.permit(:account_update, keys: attributes)
  end
end
