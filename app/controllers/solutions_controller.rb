class SolutionsController < ApplicationController
  before_action :set_solution, only: [:show, :edit, :update, :destroy]
  before_action :check_for_cancel, :only => [:create, :update] 
  after_action :dependence_change, only: [:update, :create]
  
  # GET /solutions
  # GET /solutions.json
  def index
    if flash[:commissioning_id]
      @solutions = Solution::where( commissioning_id: flash[:commissioning_id] ).
        order( :label )
      flash.keep( :commissioning_id )
    else
      @solutions = Solution::order( :label )
    end
    super
  end

  # GET /solutions/1
  # GET /solutions/1.json
  def show
    flash.keep( :commissioning_id ) if flash[:commissioning_id]
    super( @solution.label )
  end

  # GET /solutions/new
  def new
    flash.keep( :commissioning_id ) if flash[:commissioning_id]
    @solution = Solution::new( commissioning_id: flash[:commissioning_id] )
    super
  end

  # GET /solutions/1/edit
  def edit
    flash.keep( :commissioning_id ) if flash[:commissioning_id]
    super( @solution.label )
  end

  # POST /solutions
  # POST /solutions.json
  def create
    @solution = Solution::new( solution_params )

    respond_to do |format|
      if @solution.save
        format.js { redirect_to @solution,
                    notice: 'Solution was successfully created.' }
        format.json { render :show, status: :created, location: @solution }
      else
        format.js { render :new,
                    alert: t( 'failed_to_create' ) }
        format.json { render json: @solution.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /solutions/1
  # PATCH/PUT /solutions/1.json
  def update

    respond_to do |format|
      if @solution.update(solution_params)
        format.html { redirect_to @solution,
                      notice: 'Solution was successfully updated.' }
        format.json { render :show, status: :ok, location: @solution }
      else
        format.js { render :edit }
        format.json { render json: @solution.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /solutions/1
  # DELETE /solutions/1.json
  def destroy
    flash.keep( :commissioning_id ) if flash[:commissioning_id]
    @solution.destroy
    super
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_solution
    @solution = Solution.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def solution_params
    params.require(:solution).permit(:label, :description, :product_id, :platform_id, :commissioning_id, :depends)
  end
  
  def check_for_cancel
    flash.keep( :commissioning_id ) if flash[:commissioning_id]
    super
  end

  def dependence_change
    @solution[:depends] = @solution.check_dependence
    @solution.save 
  end

end
