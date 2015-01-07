class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :require_login
  after_action :cache_referer

  helper_method :current_user

  rescue_from CanCan::AccessDenied do |exception|
    flash[:alert] = exception.message
    redirect_to root_path
  end

  def current_user
    User::find_by_auth_token( cookies[:auth_token] ) if cookies[:auth_token]
  end
  
  def back( *args )
    if session[:referer].size == 1 # do nothing if no history exists
      render nothing: true
    else
      session[:referer_use_flag] = true
      session[:referer].pop         # discard current page
      path = session[:referer].last # return to last page
      respond_to do |format|
        format.html { redirect_to path, *args }
      end
    end
  end

  private
  def require_login
    return if cookies[:auth_token]
    redirect_to login_path, alert: 'Please log in.'
  end

  def cache_referer
    return if session[:referer_use_flag]
    session[:referer] ||= [ ]
    uri = request.path
    session[:referer] << uri unless session[:referer].last == uri
  ensure
    session[:referer_use_flag] = nil
  end

  protected
  # Cancels data update/creation in case cancel button is pressed.
  def check_for_cancel
    return unless params[:commit] == t( :cancel )
    back( notice: 'Changes discarded.' )
  end
end
