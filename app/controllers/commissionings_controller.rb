class CommissioningsController < ApplicationController
  before_action :set_commissioning, only: [:show, :edit, :update, :destroy]
  before_filter :check_for_cancel, :only => [:create, :update]

  # GET /commissionings
  # GET /commissionings.json
  def index
    @commissionings = Commissioning::order( 'label' )
  end

  # GET /commissionings/1
  # GET /commissionings/1.json
  def show
  end
  
  def add_user
    @f = params[:form]
    render( 'add_user', format: :js )
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
    p[:users].collect! { |i| User.find( i.to_i ) }
    
    # Debugging purposes.
    # logger.debug '=' * 32
    # logger.debug "Size: #{p[:users].size}"
    # logger.debug "Users: #{p[:users]}"
    # logger.debug "Creator: #{p[:creator_id]}"
    # logger.debug '=' * 32
    
    @commissioning = Commissioning.new( p )

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
    p[:users].collect! { |i| User.find( i.to_i ) }
    
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
    params.require(:commissioning).permit(:label, :description, :client_id, :creator_id, { users: [ ], active_users: [ ], solutions: [ ], activities: [ ] })
  end
  
  # Cancels data update/creation in case cancel button is pressed.
  def check_for_cancel
    redirect_to( commissionings_path, notice: 'Changes discarded.' ) if params[:commit] == 'Cancel'
  end
end
