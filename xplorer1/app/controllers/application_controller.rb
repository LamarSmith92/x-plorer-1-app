class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
    protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:first_name, :last_name,  :birthday, :email, :password, :birthday, :city, :state, :birthday, :remember_me)}
    devise_parameter_sanitizer.permit(:sign_in) { |u| u.permit(:email, :password, :remember_me)}
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:first_name, :last_name, :birthday, :email, :password, :about, :current_password, :remember_me)}
  end

  def after_sign_in_path_for(resource_or_scope)
    if session[:user_return_to]== nil
      user_path(@user)
    else
      super
    end
  end

  private
  def after_sign_out_path_for(resource)
    new_user_session_path
  end

end
