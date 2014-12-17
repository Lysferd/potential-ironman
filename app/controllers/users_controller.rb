class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_filter :check_for_cancel, :only => [:create, :update]
  
  def index
    @users = User::order( :name )
  end

  def show
    @user = User::find( params[:id] )
    
    respond_to do | format |
      format.html
      format.xml { render xml: @user }
    end
  end

  def new
    @user = User::new

    respond_to do | format |
      format.html
      format.xml { render xml: @user }
    end
  end

  def edit
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user,
                      notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user,
                      notice: 'User was created successfully.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_path, notice: 'User deleted.' }
      format.json { head :no_content }
    end
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :reg, :cpf, :ctps, :ci, :pis, :role_id )
  end

  def check_for_cancel
    if params[:commit] == t( :cancel )
      redirect_to( users_path, notice: 'Changes discarded.' )
    end
  end
end
