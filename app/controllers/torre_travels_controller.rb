class TorreTravelsController < ApplicationController
  before_action :set_torre_travel, only: [:show, :edit, :update, :destroy]

  # GET /torre_travels
  # GET /torre_travels.json
  def index
    @torre_travels = TorreTravel.all
  end

  def all_housings
    @torre_travels = TorreTravel.all
  end

  # GET /torre_travels/1
  # GET /torre_travels/1.json
  def show
    @torre_travel = TorreTravel.find(params[:id])
  end

  # GET /torre_travels/new
  def new
    @torre_travel = TorreTravel.new
  end

  # GET /torre_travels/1/edit
  def edit
  end

  # POST /torre_travels
  # POST /torre_travels.json
  def create
    @torre_travel = TorreTravel.new(torre_travel_params)

    respond_to do |format|
      if signed_in?
        @torre_travel.save
        format.html { redirect_to @torre_travel, notice: 'Torre travel was successfully created.' }
        format.json { render :show, status: :created, location: @torre_travel }
      else
        format.html { render :new }
        format.json { render json: @torre_travel.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /torre_travels/1
  # PATCH/PUT /torre_travels/1.json
  def update
    if signed_in?
      respond_to do |format|
        if @torre_travel.update(torre_travel_params)
          format.html { redirect_to @torre_travel, notice: 'Torre travel was successfully updated.' }
          format.json { render :show, status: :ok, location: @torre_travel }
        else
          format.html { render :edit }
          format.json { render json: @torre_travel.errors, status: :unprocessable_entity }
        end
      end
      else
        redirect_to :root
    end
  end

  # DELETE /torre_travels/1
  # DELETE /torre_travels/1.json
  def destroy
    @torre_travel.destroy
    respond_to do |format|
      format.html { redirect_to torre_travels_url, notice: 'Torre travel was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def housing
    @torre_travels = TorreTravel.where(housing: params[:housing])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_torre_travel
      @torre_travel = TorreTravel.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def torre_travel_params
      params.require(:torre_travel).permit(:housing, :price, :distance, :description, :description_es)
    end
end
