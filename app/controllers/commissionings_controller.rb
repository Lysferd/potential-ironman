class CommissioningsController < ApplicationController
  before_action :set_commissioning, only: [:show, :edit, :update, :destroy]

  # GET /commissionings
  # GET /commissionings.json
  def index
    @commissionings = Commissioning.all
  end

  # GET /commissionings/1
  # GET /commissionings/1.json
  def show
  end

  # GET /commissionings/new
  def new
    @commissioning = Commissioning.new
  end

  # GET /commissionings/1/edit
  def edit
  end

  # POST /commissionings
  # POST /commissionings.json
  def create
    p = commissioning_params
    p[:users].delete( '' )
    p[:users].collect! { |i| User.find_by_id(i.to_i) }
    @commissioning = Commissioning.new(p)

    respond_to do |format|
      if @commissioning.save
        format.html { redirect_to @commissioning, notice: 'Commissioning was successfully created.' }
        format.json { render :show, status: :created, location: @commissioning }
      else
        format.html { render :new }
        format.json { render json: @commissioning.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /commissionings/1
  # PATCH/PUT /commissionings/1.json
  def update
    p = commissioning_params
    p[:users].delete( '' )
    p[:users].collect! { |i| User.find_by_id(i.to_i) }
    
    respond_to do |format|
      if @commissioning.update(p)
        format.html { redirect_to @commissioning, notice: 'Commissioning was successfully updated.' }
        format.json { render :show, status: :ok, location: @commissioning }
      else
        format.html { render :edit }
        format.json { render json: @commissioning.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /commissionings/1
  # DELETE /commissionings/1.json
  def destroy
    @commissioning.destroy
    respond_to do |format|
      format.html { redirect_to commissionings_url, notice: 'Commissioning was successfully destroyed.' }
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
      params.require(:commissioning).permit(:label, :description, :client_id, :solutions_id, { users: [ ] })
    end
end
