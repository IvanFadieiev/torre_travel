class TorreTravelsController < ApplicationController
  before_action :set_torre_travel, only: [:show, :edit, :update, :destroy]
  before_action :all_torre_travels, only: [:index, :all_housings]

  def all_housings
    
  end

  def show
  end

  def new
    if signed_in?
      @torre_travel = TorreTravel.new
    else
      redirect_to :root
    end
  end

  def index
    @slyders = Slyder.all
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
          format.html { redirect_to @torre_travel, notice: 'Жилье успешно обновлено!' }
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
        format.html { redirect_to all_types_path, notice: 'Жилье успешно удалено!' }
        format.json { head :no_content }
      end      
        AdminMailer.torre_travel_destroyed(@torre_travel).deliver_now
    else
      redirect_to :root
    end
  end

  def housing
    @torre_travels = TorreTravel.where(housing: params[:housing])
  end

  def service  
  end

  # def image(id)
  #   Image.where(torre_travel_id = (:id)).first.image_of_housing.url(:small)
  # end

private
    def all_torre_travels
      @torre_travels = TorreTravel.all
    end

    def set_torre_travel
      @torre_travel = TorreTravel.find(params[:id])
    end

    def torre_travel_params
      params.require(:torre_travel).permit(:housing, :price, :distance, :description, :description_es, :distance_m, :address)
    end
end
