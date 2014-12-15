class UsersController < ApplicationController
  before_filter :check_for_cancel, :only => [:create, :update]
  before_filter :authenticate_user!
  
  def index
    @users = User.all
  end

  def destroy
    @user = User::find( params[:id] )
    if @user.destroy
      redirect_to users_path, notice: 'User deleted.'
    end
  end
  
  def show
    @user = User.find(params[:id])
    redirect_to :back, :alert => "Access denied." unless @user == current_user
  end
end
