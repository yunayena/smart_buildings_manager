class MeasuresController < ApplicationController
  before_action :check_permissions, only: [:show, :edit, :update, :destroy]
  before_action :set_measure, only: [:show, :edit, :update, :destroy]

  # GET /measures
  # GET /measures.json
  def index
    @measures = current_user.measures
  end

  # GET /measures/1
  # GET /measures/1.json
  def show
  end

  # GET /measures/new
  def new
    @measure = Measure.new
  end

  # GET /measures/1/edit
  def edit
  end

  # POST /measures
  # POST /measures.json
  def create
    @measure = Measure.new(measure_params.merge!(user: current_user))

    respond_to do |format|
      if @measure.save
        format.html { redirect_to @measure, notice: t('.notice')  }
        format.json { render :show, status: :created, location: @measure }
      else
        format.html { render :new }
        format.json { render json: @measure.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /measures/1
  # PATCH/PUT /measures/1.json
  def update
    respond_to do |format|
      if @measure.update(measure_params.merge!(user: current_user))
        format.html { redirect_to @measure, notice: t('.notice2') }
        format.json { render :show, status: :ok, location: @measure }
      else
        format.html { render :edit }
        format.json { render json: @measure.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /measures/1
  # DELETE /measures/1.json
  def destroy
    @measure.destroy
    respond_to do |format|
      format.html { redirect_to measures_url, notice: t('.notice3') }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_measure
      @measure = Measure.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def measure_params
      params.require(:measure).permit(:value, :metric)
    end

    def check_permissions
      measure = Measure.find(params[:id])

      if !current_user.measures.include?(measure)
        redirect_to measures_path
      end
    end
end
