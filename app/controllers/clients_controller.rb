class ClientsController < ApplicationController
  before_action :set_client, only: [:show, :edit, :update, :destroy]
  before_action :check_for_cancel, :only => [:create, :update]

  # GET /clients
  # GET /clients.json
  def index
    @clients = Client::order( :label )
    super
  end

  # GET /clients/1
  # GET /clients/1.json
  def show
    super( @client.label )
  end

  # GET /clients/new
  def new
    @client = Client.new
    super
  end

  # GET /clients/1/edit
  def edit
    super( @client.label )
  end

  # POST /clients
  # POST /clients.json
  def create
    @client = Client.new(client_params)

    respond_to do |format|
      if @client.save
        format.js { redirect_to @client, notice: 'Client was successfully created.' }
        format.json { render :show, status: :created, location: @client }
      else
        format.js { render :new }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clients/1
  # PATCH/PUT /clients/1.json
  def update
    respond_to do |format|
      if @client.update(client_params)
        format.js { redirect_to @client, notice: 'Client was successfully updated.' }
        format.json { render :show, status: :ok, location: @client }
      else
        format.js { render :edit }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clients/1
  # DELETE /clients/1.json
  def destroy
    @client.destroy
    super
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_client
    @client = Client.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def client_params
    params.require(:client).permit(:label, :homepage)
  end
end
