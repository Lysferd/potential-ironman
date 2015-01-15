class ManufacturersController < ApplicationController
  before_action :set_manufacturer, only: [:show, :edit, :update, :destroy]
  before_action :check_for_cancel, :only => [:create, :update]

  # GET /manufacturers
  # GET /manufacturers.json
  def index
    @manufacturers = Manufacturer::order( :label )
    super
  end

  # GET /manufacturers/1
  # GET /manufacturers/1.json
  def show
    super( @manufacturer.label )
  end

  # GET /manufacturers/new
  def new
    @manufacturer = Manufacturer.new
    super
  end

  # GET /manufacturers/1/edit
  def edit
    super( @manufacturer.label )
  end

  # POST /manufacturers
  # POST /manufacturers.json
  def create
    @manufacturer = Manufacturer.new(manufacturer_params)

    respond_to do |format|
      if @manufacturer.save
        format.js { redirect_to manufacturers_url,
                      notice: 'Manufacturer was successfully created.' }
        format.json { render :index, status: :created,
                      location: manufacturers_url }
      else
        format.js { render :new }
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
        format.js { redirect_to manufacturers_url,
                      notice: 'Manufacturer was successfully updated.' }
        format.json { render :index, status: :ok, location: manufacturers_url }
      else
        format.js { render :edit }
        format.json { render json: @manufacturer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /manufacturers/1
  # DELETE /manufacturers/1.json
  def destroy
    @manufacturer.destroy
    super
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
end
