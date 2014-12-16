class PermissionsController < ApplicationController
  before_action :set_permission, only: [:show, :edit, :update, :destroy]
  before_filter :check_for_cancel, :only => [:create, :update]

  # GET /permissions
  # GET /permissions.json
  def index
    @permissions = Permission::order( :id )
  end

  # GET /permissions/1
  # GET /permissions/1.json
  def show
  end

  # GET /permissions/new
  def new
    @permission = Permission.new
  end

  # GET /permissions/1/edit
  def edit
  end

  # POST /permissions
  # POST /permissions.json
  def create
    p = permission_params
    m = p[:mode].reverse
    
    m.each_with_index do | b, i |
      m.delete_at( i + 1 ) if b == '1'
    end
    
    m.reverse!
    p[:mode] = m[0..2].join.to_i( 2 ).to_s + m[3..5].join.to_i( 2 ).to_s + m[6..8].join.to_i( 2 ).to_s
    
    # Debugging purposes.
    # logger.debug '=' * 32
    # logger.debug "Bits: #{p[:mode].size}"
    # logger.debug "\s"*6 + "L" + "\s"*(p[:mode].size-1) + "H"
    # logger.debug "Bits: #{p[:mode]}"
    # logger.debug "#{p[:mode]}"
    # logger.debug '=' * 32
    
    @permission = Permission.new(p)

    respond_to do |format|
      if @permission.save
        format.html { redirect_to permissions_path, notice: 'Permission was successfully created.' }
        format.json { render :index, status: :created, location: permissions_path }
      else
        format.html { render :new }
        format.json { render json: @permission.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /permissions/1
  # PATCH/PUT /permissions/1.json
  def update
    p = permission_params
    m = p[:mode].reverse
    
    m.each_with_index do | b, i |
      if b == '1'
        m.delete_at( i + 1 )
      end
    end
    
    m.reverse!
    p[:mode] = m[0..2].join.to_i( 2 ).to_s + m[3..5].join.to_i( 2 ).to_s + m[6..8].join.to_i( 2 ).to_s
    
    respond_to do |format|
      if @permission.update(p)
        format.html { redirect_to permissions_path, notice: 'Permission was successfully updated.' }
        format.json { render :index, status: :ok, location: permissions_path }
      else
        format.html { render :edit }
        format.json { render json: @permission.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /permissions/1
  # DELETE /permissions/1.json
  def destroy
    @permission.destroy
    respond_to do |format|
      format.html { redirect_to permissions_url, notice: 'Permission was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_permission
    @permission = Permission.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def permission_params
    params.require(:permission).permit(:label, { mode: [ ] })
  end
  
  # Cancels data update/creation in case cancel button is pressed.
  def check_for_cancel
    redirect_to( permissions_path, notice: 'Changes discarded.' ) if params[:commit] == 'Cancel'
  end
end
