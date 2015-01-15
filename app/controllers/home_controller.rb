class HomeController < ApplicationController
  skip_before_action :require_login, only: [ :login, :create ]

  def index
    session[:referer] = nil
    redirect_to menu_path if browser.mobile?
  end

  def login
    redirect_to( browser.mobile? ? menu_path : root_path ) if cookies[:auth_token]
  end

  def create
    if user = User::authenticate( params[:email], params[:password] )
      if params[:remember_me]
        cookies.permanent[:auth_token] = user.auth_token
      else
        cookies[:auth_token] = user.auth_token
      end
        redirect_to( browser.mobile? ? menu_path : root_path )
    else
      redirect_to( login_path )#, alert: 'Invalid login.' )
    end
  end

  def destroy
    reset_session
    cookies.delete( :auth_token )
    redirect_to( login_path )
  end

end
