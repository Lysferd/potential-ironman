class CommissioningsController < ApplicationController
  before_action :set_commissioning, only: [:show, :edit, :update, :destroy]
  before_action :check_for_cancel, only: [:create, :update]
  #before_action :refresh_title, except: [ :create, :update, :destroy ]

  # GET /commissionings
  # GET /commissionings.json
  def index
    @commissionings = Commissioning::order( :label )
    super
  end

  # GET /commissionings/1
  # GET /commissionings/1.json
  def show
    flash[:commissioning_id] = params[:id]
    super( @commissioning.label )
  end

  # GET /commissionings/new
  def new
    @commissioning = Commissioning::new( creator_id: current_user.id )
    super
  end

  # GET /commissionings/1/edit
  def edit
    super( @commissioning.label )
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
    super
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
