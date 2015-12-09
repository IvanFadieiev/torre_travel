class TorreTravelsController < ApplicationController
  before_action :set_torre_travel, only: [:show, :edit, :update, :destroy]
  before_action :all_torre_travels, only: [:index, :all_housings]

  def show
    @torre_travel = TorreTravel.find(params[:id])
  end

  def new
    @torre_travel = TorreTravel.new
  end

  def edit
  end

  def create
    @torre_travel = TorreTravel.new(torre_travel_params)
     if signed_in?
      if @torre_travel.save
        redirect_to @torre_travel, notice: 'Жилье успешно создано!'
      else
        render 'new'
      end
    else
      redirect_to :root
    end
  end

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

  def destroy
    if signed_in?
      @torre_travel.destroy
      respond_to do |format|
        format.html { redirect_to torre_travels_url, notice: 'Torre travel was successfully destroyed.' }
        format.json { head :no_content }
      end
    else
      redirect_to :root
    end
  end

  def housing
    @torre_travels = TorreTravel.where(housing: params[:housing])
  end

private
    def all_torre_travels
      @torre_travels = TorreTravel.all
    end

    def set_torre_travel
      @torre_travel = TorreTravel.find(params[:id])
    end

    def torre_travel_params
      params.require(:torre_travel).permit(:housing, :price, :distance, :description, :description_es)
    end
end
