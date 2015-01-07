class CommissioningsController < ApplicationController
  before_action :set_commissioning, only: [:show, :edit, :update, :destroy]
  before_action :check_for_cancel, :only => [:create, :update]

  # GET /commissionings
  # GET /commissionings.json
  def index
    @commissionings = Commissioning::order( :label )
    respond_to do |format|
      format.html
      format.js
    end
  end

  # GET /commissionings/1
  # GET /commissionings/1.json
  def show
  end

  # GET /commissionings/new
  def new
    @commissioning = Commissioning::new( creator_id: current_user.id )
  end

  # GET /commissionings/1/edit
  def edit
  end

  # POST /commissionings
  # POST /commissionings.json
  def create
    @commissioning = Commissioning.new( commissioning_params )
    respond_to do |format|
      if @commissioning.save
        format.js { redirect_to @commissioning, notice: 'Commissioning was successfully created.' }
        format.json { render :show, status: :created, location: @commissioning }
      else
        format.js { render :new }
        format.json { render json: @commissioning.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /commissionings/1
  # PATCH/PUT /commissionings/1.json
  def update
    respond_to do |format|
      if @commissioning.update(commissioning_params)
        format.js { redirect_to @commissioning, notice: 'Commissioning was successfully updated.' }
        format.json { render :show, status: :ok, location: @commissioning }
      else
        format.js { render :edit }
        format.json { render json: @commissioning.errors, status: :unprocessable_entity }
      end
    end
  end
  
  # DELETE /commissionings/1
  # DELETE /commissionings/1.json
  def destroy
    @commissioning.destroy
    respond_to do |format|
      format.js { redirect_to :index, notice: 'Commissioning was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_commissioning
    @commissioning = Commissioning.find(params[:id])
  end
  
  # Never trust parameters from the scary internet, only allow the white list through.
  def commissioning_params
    params.require(:commissioning).permit(:label, :description, :client_id, :creator_id, commissioners: [ ], solutions: [ ], activities: [ ] )
  end
end
