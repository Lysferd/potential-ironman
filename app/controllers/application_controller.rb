class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :require_login, unless: lambda { cookies[:auth_token] }
  
  after_action :cache_referer, if: lambda { cookies[:auth_token] and request.method == 'GET' }
  after_action :flash_to_headers, if: lambda { request.xhr? } 

  rescue_from CanCan::AccessDenied do |exception|
    flash[:alert] = exception.message
    redirect_to root_path
  end

  def current_user
    User::find_by_auth_token( cookies[:auth_token] ) if cookies[:auth_token]
  end
  helper_method :current_user
  
  def back( *args )
    unless session[:referer].size == 1 # no history exists
      # discard current page and all subsequent invalid records and duplicates
      current = session[:referer].pop
      session[:referer].pop while not record_exists?( session[:referer].last ) or
        session[:referer].last == current
    end

    path = session[:referer].last # return to last page
    respond_to do |format|
      format.html { redirect_to path, *args }
    end
  ensure
    session[:referer_use_flag] = true
    flash.keep( :commissioning_id ) if flash[:commissioning_id]
  end

  private
  def require_login
    return if cookies[:auth_token]
    redirect_to( login_path ) #, alert: 'Please log in.' )
  end

  def cache_referer
    return if session[:referer_use_flag]
    uri = request.path
    session[:referer] ||= [ ]
    session[:referer] << uri unless session[:referer].last == uri
  ensure
    session[:referer_use_flag] = nil
  end

  def record_exists?( str )
    return false if str =~ /\/(new|edit)/
    return true unless str =~ /\d+/
    record, id = *str.split( '/' )[1..2]
    return record.classify.constantize.exists?( id )
  end

  def flash_to_headers
    response.headers['X-Flash-Messages'] = flash_json
  end

  def flash_json
    flash.inject({}) do |hash, (type, message)|
      message = "#{ERB::Util::html_escape( message )}"
      message = URI.escape( message )
      hash[type] = message
      hash
    end.to_json
  end

  protected
  # Cancels data update/creation in case cancel button is pressed.
  def check_for_cancel
    return unless params[:commit] == t( :cancel )
    back( notice: 'Alterações descartadas.' )
  end

  def title_base
    return t( "headers.#{action_name}" ) + ' '
  end

  #-------------------------------------------------------------------------
  # Common Controller Methods
  #-------------------------------------------------------------------------
  def index
    flash[:title] = title_base + t( "models.#{controller_name}", count: 2 )
  end

  def show( string )
    flash[:title] = title_base + string
  end
  alias :edit :show

  def new
    flash[:title] = title_base + t( "models.#{controller_name}", count: 1 )
  end

  def destroy( success = true )
    respond_to do |format|
      if success
        format.js { redirect_to session[:referer].last,
                    status: :see_other,
                    notice: 'Elemento removido.' }
      else
        format.js { redirect_to session[:referer].last,
                    status: :see_other,
                    alert: 'Elemento não pôde ser removido.' }
      end
    end
  end
end
