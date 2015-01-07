class RolesController < ApplicationController
  before_action :set_role, only: [:show, :edit, :update, :destroy]
  before_action :check_for_cancel, :only => [:create, :update]

  def index
    @roles = Role::order( :label )
  end

  def show
  end

  def new
    @role = Role::new
  end

  def edit
  end

  def create
    @role = Role::new(role_params)
    byebug
    
    respond_to do |format|
      if @role.save
        format.js { redirect_to roles_path, notice: 'Role was successfully created.' }
        format.json { render :index, status: :created, location: roles_path }
      else
        format.js { render :new }
        format.json { render json: @role.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @role.update(role_params)
        format.js { redirect_to roles_path, notice: 'Role was successfully created.' }
        format.json { render :index, status: :created, location: roles_path }
      else
        format.js { render :edit }
        format.json { render json: @role.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @role.destroy
    respond_to do |format|
      format.js { redirect_to :index, notice: 'Role was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def set_role
    @role = Role.find(params[:id])
  end

  def role_params
    params.require(:role).permit(:label).tap do |whitelist|
      whitelist[:rules] = params[:role][:rules]
    end
  end
end
