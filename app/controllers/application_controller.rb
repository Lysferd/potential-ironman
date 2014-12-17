class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :require_login

  rescue_from CanCan::AccessDenied do |exception|
    flash[:alert] = exception.message
    redirect_to root_url
  end

  private
  def require_login
    return if session[:user_id]
    redirect_to login_path, alert: 'Please log in.'
  end

  def after_sign_out_path_for( arg )
    login_path
  end
end
