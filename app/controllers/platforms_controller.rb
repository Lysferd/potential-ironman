class PlatformsController < ApplicationController
  before_action :set_platform, only: [:show, :edit, :update, :destroy]
  before_action :check_for_cancel, :only => [:create, :update]

  # GET /platforms
  # GET /platforms.json
  def index
    @platforms = Platform::order( :label )
    super
  end

  # GET /platforms/1
  # GET /platforms/1.json
  def show
    super( @platform.label )
  end

  # GET /platforms/new
  def new
    @platform = Platform.new
    super
  end

  # GET /platforms/1/edit
  def edit
    super( @platform.label )
  end

  # POST /platforms
  # POST /platforms.json
  def create
    @platform = Platform.new(platform_params)

    respond_to do |format|
      if @platform.save
        format.js { redirect_to @platform, notice: 'Platform was successfully created.' }
        format.json { render :show, status: :created, location: @platform }
      else
        format.js { render :new }
        format.json { render json: @platform.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /platforms/1
  # PATCH/PUT /platforms/1.json
  def update
    respond_to do |format|
      if @platform.update(platform_params)
        format.js { redirect_to @platform, notice: 'Platform was successfully updated.' }
        format.json { render :show, status: :ok, location: @platform }
      else
        format.js { render :edit }
        format.json { render json: @platform.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /platforms/1
  # DELETE /platforms/1.json
  def destroy
    @platform.destroy
    super
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_platform
    @platform = Platform.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def platform_params
    params.require(:platform).permit(:label, :description, :manufacturer_id)
  end
end
