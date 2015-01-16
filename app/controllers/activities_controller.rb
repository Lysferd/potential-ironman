class ActivitiesController < ApplicationController
  before_action :set_activity, only: [:show, :edit, :update, :destroy]
  before_action :check_for_cancel, :only => [:create, :update]

  # GET /activities
  # GET /activities.json
  def index
    if flash[:commissioning_id]
      @activities = Activity::where( commissioning_id: flash[:commissioning_id] ).
        order( :label )
      flash.keep( :commissioning_id )
    else
      @activities = Activity::order( :label )
    end
    super
  end

  # GET /activities/1
  # GET /activities/1.json
  def show
    flash.keep( :commissioning_id ) if flash[:commissioning_id]
    super( @activity.label )
  end

  # GET /activities/new
  def new
    flash.keep( :commissioning_id ) if flash[:commissioning_id]
    @activity = Activity.new
    super
  end

  # GET /activities/1/edit
  def edit
    flash.keep( :commissioning_id ) if flash[:commissioning_id]
    super( @activity.label )
  end

  # POST /activities
  # POST /activities.json
  def create
    @activity = Activity.new(activity_params)

    respond_to do |format|
      if @activity.save
        format.js { redirect_to @activity,
                    notice: 'Activity was successfully created.' }
        format.json { render :show, status: :created, location: @activity }
      else
        format.js { render :new }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /activities/1
  # PATCH/PUT /activities/1.json
  def update
    respond_to do |format|
      if @activity.update(activity_params)
        format.js { redirect_to @activity, notice: 'Activity was successfully updated.' }
        format.json { render :show, status: :ok, location: @activity }
      else
        format.js { render :edit }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /activities/1
  # DELETE /activities/1.json
  def destroy
    flash.keep( :commissioning_id ) if flash[:commissioning_id]
    @activity.destroy
    super
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_activity
    @activity = Activity.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def activity_params
    params.require(:activity).permit(:label, :description, :date_start, :date_end, :user_id, :commissioning_id)
  end

  def check_for_cancel
    flash.keep( :commissioning_id ) if flash[:commissioning_id]
    super
  end
end
