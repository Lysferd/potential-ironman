class HomeController < ApplicationController
  skip_before_action :require_login, only: [ :login, :create ]

  def index
  end

  def admin
  end

  def create
    if user = User::authenticate( params[:email], params[:password] )
      session[:user_id] = user.id
      redirect_to root_path
    else
      redirect_to login_path, alert: 'Invalid login.'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path, notice: 'Logged out.'
  end

end
