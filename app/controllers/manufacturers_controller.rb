class ManufacturersController < ApplicationController
  before_action :set_manufacturer, only: [:show, :edit, :update, :destroy]
  before_filter :check_for_cancel, :only => [:create, :update]

  # GET /manufacturers
  # GET /manufacturers.json
  def index
    @manufacturers = Manufacturer::order( :label )
  end

  # GET /manufacturers/1
  # GET /manufacturers/1.json
  def show
  end

  # GET /manufacturers/new
  def new
    @manufacturer = Manufacturer.new
  end

  # GET /manufacturers/1/edit
  def edit
  end

  # POST /manufacturers
  # POST /manufacturers.json
  def create
    @manufacturer = Manufacturer.new(manufacturer_params)

    respond_to do |format|
      if @manufacturer.save
        format.html { redirect_to manufacturers_url,
                      notice: 'Manufacturer was successfully created.' }
        format.json { render :index, status: :created,
                      location: manufacturers_url }
      else
        format.html { render :new }
        format.json { render json: @manufacturer.errors,
                      status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /manufacturers/1
  # PATCH/PUT /manufacturers/1.json
  def update
    respond_to do |format|
      if @manufacturer.update(manufacturer_params)
        format.html { redirect_to manufacturers_url,
                      notice: 'Manufacturer was successfully updated.' }
        format.json { render :index, status: :ok, location: manufacturers_url }
      else
        format.html { render :edit }
        format.json { render json: @manufacturer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /manufacturers/1
  # DELETE /manufacturers/1.json
  def destroy
    @manufacturer.destroy
    respond_to do |format|
      format.html { redirect_to manufacturers_url, notice: 'Manufacturer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_manufacturer
    @manufacturer = Manufacturer.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def manufacturer_params
    params.require(:manufacturer).permit(:label)
  end

  # Cancels data update/creation in case cancel button is pressed.
  def check_for_cancel
    redirect_to( manufacturers_path, notice: 'Changes discarded.' ) if params[:commit] == 'Cancel'
  end
end
