class ProductTypesController < ApplicationController
  before_action :set_product_type, only: [:show, :edit, :update, :destroy]
  before_action :check_for_cancel, :only => [:create, :update]

  # GET /product_types
  # GET /product_types.json
  def index
    @product_types = ProductType::order( :label )
    super
  end

  # GET /product_types/1
  # GET /product_types/1.json
  def show
    super( @product_type.label )
  end

  # GET /product_types/new
  def new
    @product_type = ProductType.new
    super
  end

  # GET /product_types/1/edit
  def edit
    super( @product_type.label )
  end

  # POST /product_types
  # POST /product_types.json
  def create
    @product_type = ProductType.new(product_type_params)

    respond_to do |format|
      if @product_type.save
        format.js { redirect_to @product_type, notice: 'Product type was successfully created.' }
        format.json { render :show, status: :created, location: @product_type }
      else
        format.js { render :new }
        format.json { render json: @product_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /product_types/1
  # PATCH/PUT /product_types/1.json
  def update
    respond_to do |format|
      if @product_type.update(product_type_params)
        format.js { redirect_to @product_type, notice: 'Product type was successfully updated.' }
        format.json { render :show, status: :ok, location: @product_type }
      else
        format.js { render :edit }
        format.json { render json: @product_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /product_types/1
  # DELETE /product_types/1.json
  def destroy
    @product_type.destroy
    super
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_product_type
    @product_type = ProductType.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def product_type_params
    params.require(:product_type).permit(:label, :description)
  end
end
