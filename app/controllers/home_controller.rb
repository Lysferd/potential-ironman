class HomeController < ApplicationController

  #before_action :check_user, only: :index
  #skip_before_action :require_login, only: [ :index, :create ]

  def index
  end

  def admin
  end
  
=begin
  def create
    if user = User::authenticate( params[:username], params[:password] )
      session[:user_id] = user.id
      redirect_to admin_url
    else
      redirect_to login_url, alert: 'Invalid login.'
    end
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to login_url, notice: 'Logged out.'
  end

  private
  def check_user
    redirect_to admin_url if session[:user_id]
  end
=end

end
