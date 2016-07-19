class BuildingsController < ApplicationController
  before_action :check_permissions, only: [:show, :edit, :update, :destroy]
  before_action :set_building, only: [:show, :edit, :update, :destroy]

  # GET /buildings
  # GET /buildings.json
  def index
    @buildings = current_user.is_admin? ? Building.all : current_user.buildings
  end

  # GET /buildings/1
  # GET /buildings/1.json
  def show
  end

  # GET /buildings/new
  def new
    @building = Building.new

  end

  # GET /buildings/1/edit
  def edit
  end

  # POST /buildings
  # POST /buildings.json
  def create
    @building = Building.new(building_params)

    respond_to do |format|
      if @building.save
        format.html { redirect_to @building, notice: t('.notice4') }
        format.json { render :show, status: :created, location: @building }
      else
        format.html { render :new }
        format.json { render json: @building.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /buildings/1
  # PATCH/PUT /buildings/1.json
  def update
    respond_to do |format|
      if @building.update(building_params)
        format.html { redirect_to @building, notice: t('.notice5') }
        format.json { render :show, status: :ok, location: @building }
      else
        format.html { render :edit }
        format.json { render json: @building.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /buildings/1
  # DELETE /buildings/1.json
  def destroy
    @building.destroy
    respond_to do |format|
      format.html { redirect_to buildings_url, notice: t('.notice6') }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_building
      @building = Building.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def building_params
      # Comprobamos que params[:user_ids] contenga el identificador del current_user.
      # De no contenerlo, se lo añadimos por defecto para asociar el building a su current_user
      if !params[:building][:user_ids].include?(current_user.id)
        params[:building][:user_ids] << current_user.id
      end

      params.require(:building).permit(:name, :description, :address, :postal_code, :phone, user_ids: [])
    end

    def check_permissions
      building = Building.find(params[:id])

      if !current_user.admin? && !current_user.buildings.include?(building)
        redirect_to buildings_path
      end
    end
end
