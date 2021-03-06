class LocationsController < ApplicationController
  before_action :check_permissions, only: [:show, :edit, :update, :destroy]
  before_action :set_location, only: [:show, :edit, :update, :destroy]

  # GET /locations
  # GET /locations.json
  def index
    @locations = current_user.is_admin? ? Location.all : Location.joins(:user).where(user: current_user)
  end

  # GET /locations/1
  # GET /locations/1.json
  def show
  end

  # GET /locations/new
  def new
    @location = Location.new
  end

  # GET /locations/1/edit
  def edit
  end

  # POST /locations
  # POST /locations.json
  def create
    @location = Location.new(location_params.merge!(user: current_user))

    respond_to do |format|
      if @location.save
        format.html { redirect_to @location, notice: t('.notice') }
        format.json { render :show, status: :created, location: @location }
      else
        format.html { render :new }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /locations/1
  # PATCH/PUT /locations/1.json
  def update
    respond_to do |format|
      if @location.update(location_params.merge!(user: current_user))
        format.html { redirect_to @location, notice:  t('.notice2')  }
        format.json { render :show, status: :ok, location: @location }
      else
        format.html { render :edit }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /locations/1
  # DELETE /locations/1.json
  def destroy
    @location.destroy
    respond_to do |format|
      format.html { redirect_to locations_url, notice:  t('.notice3')  }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_location
      @location = Location.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def location_params
      params.require(:location).permit(:name, :description, :building_id)
    end

    def check_permissions
      location = Location.find(params[:id])

      if !current_user.admin? && !current_user.buildings.map(&:locations).uniq.include?(location)
        redirect_to locations_path
      end
    end
end
