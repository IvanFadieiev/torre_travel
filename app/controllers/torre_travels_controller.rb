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
      render file: 'public/404.html', status: :not_found, layout: false
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
        AdminMailer.new_housing(@torre_travel).deliver_now
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
          AdminMailer.edit_housing(@torre_travel).deliver_now
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
    @torre_travels = TorreTravel.paginate(page: params[:page], :per_page => 4).where(housing: params[:housing])
  end

  def service  
  end

private
    def all_torre_travels
      @torre_travels = TorreTravel.paginate(page: params[:page], :per_page => 4)
    end

    def set_torre_travel
     begin
      if params[:q]
        tt = TorreTravel.find_by_id(params[:q])
        if tt.nil?
          redirect_to :back, notice: "Вы допустили ошибку! Введите ID еще раз"
        else
          @torre_travel = tt
        end
      else
        @torre_travel = TorreTravel.find(params[:id])
      end
      rescue ActiveRecord::RecordNotFound
        logger.error "#{params[:id]} не найдено"
        redirect_to torre_travels_path, notice: 'Жилье не найдено'
      end
    end

    def torre_travel_params
      params.require(:torre_travel).permit(:housing, :price, :distance, :description, :description_es, :distance_m, :address)
    end
end
