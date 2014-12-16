class RolesController < ApplicationController
  before_action :set_role, only: [:show, :edit, :update, :destroy]
  before_filter :check_for_cancel, :only => [:create, :update]

  respond_to :html

  def index
    @roles = Role.all
    respond_with(@roles)
  end

  def show
    respond_with(@role)
  end

  def new
    @role = Role.new
    respond_with(@role)
  end

  def edit
  end

  def create
    @role = Role.new(role_params)
    
    respond_to do |format|
      if @role.save
        format.html { redirect_to roles_path, notice: 'Role was successfully created.' }
        format.json { render :index, status: :created, location: roles_path }
      else
        format.html { render :new }
        format.json { render json: @role.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @role.update(role_params)
        format.html { redirect_to roles_path, notice: 'Role was successfully created.' }
        format.json { render :index, status: :created, location: roles_path }
      else
        format.html { render :edit }
        format.json { render json: @role.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @role.destroy
    respond_with(@role)
  end

  private
  def set_role
    @role = Role.find(params[:id])
  end

  def role_params
    params.require(:role).permit(:label)
  end
  
  # Cancels data update/creation in case cancel button is pressed.
  def check_for_cancel
    redirect_to( roles_path, notice: 'Changes discarded.' ) if params[:commit] == 'Cancel'
  end
end
