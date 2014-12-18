class HomeController < ApplicationController
  skip_before_action :require_login, only: [ :login, :create ]

  def index
    redirect_to menu_path if browser.mobile?
  end

  def admin
  end

  def create
    if user = User::authenticate( params[:email], params[:password] )
      if params[:remember_me]
        cookies.permanent[:auth_token] = user.auth_token
      else
        cookies[:auth_token] = user.auth_token
      end
      redirect_to browser.mobile? ? menu_path : root_path
    else
      redirect_to login_path, alert: 'Invalid login.'
    end
  end

  def destroy
    cookies.delete( :auth_token )
    redirect_to login_path, notice: 'Logged out.'
  end

end
