class HomeController < ApplicationController
  skip_before_action :require_login, only: [ :login, :create ]

  def index
    session[:referer] = nil
    redirect_to menu_path if browser.mobile?

    case current_user.role.label
    when 'Administrador'
      @obj = User::all
    when 'Gerente'
      @obj = User::all
    when 'Analista'
      @obj = Product::all
    when 'Comissionador'
      @obj = Activity::all
    when 'Projetista'
      @obj = Commissioning::where( creator_id: current_user.id )
      #@solutions = @commissionings.inject( [ ] ) do | memo, commissioning |
      #  memo << Solution::where( commissioning_id: commissioning.id )
      #end.flatten
    end
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
