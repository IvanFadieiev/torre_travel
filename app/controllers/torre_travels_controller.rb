class TorreTravelsController < ApplicationController
  before_action :set_torre_travel, only: [:show]
  before_action :all_torre_travels, only: [:index, :all_housings]

  def index
    @slyders = Slyder.all
  end

  # def create
  #   @torre_travel = TorreTravel.new(torre_travel_params)
  #   if signed_in?
  #     if @torre_travel.save
  #       redirect_to @torre_travel, notice: 'Жилье успешно создано!'
  #       # AdminMailer.new_housing(@torre_travel).deliver_now
  #     else
  #       render 'new'
  #     end
  #   else
  #     redirect_to :root
  #   end
  # end

  # def update
  #   if signed_in?
  #     respond_to do |format|
  #       if @torre_travel.update(torre_travel_params)
  #         # AdminMailer.edit_housing(@torre_travel).deliver_now
  #         format.html do
  #           redirect_to @torre_travel, notice: 'Жилье успешно обновлено!'
  #         end
  #         format.json { render :show, status: :ok, location: @torre_travel }
  #       else
  #         format.html { render :edit }
  #         format.json do
  #           render json: @torre_travel.errors, status: :unprocessable_entity
  #         end
  #       end
  #     end
  #     else
  #       redirect_to :root
  #   end
  # end

  # def destroy
  #   if signed_in?
  #     @torre_travel.destroy
  #     respond_to do |format|
  #       format.html do
  #         redirect_to all_types_path, notice: 'Жилье успешно удалено!'
  #       end
  #       format.json { head :no_content }
  #     end      
  #       # AdminMailer.torre_travel_destroyed(@torre_travel).deliver_now
  #   else
  #     redirect_to :root
  #   end
  # end

  def housing
    @torre_travels = TorreTravel.paginate(page: params[:page], per_page: 4).where(housing: params[:housing])
  end

  def service  
  end

private
  def all_torre_travels
    @torre_travels = TorreTravel.paginate(page: params[:page], per_page: 4)
  end

  def set_torre_travel
    @torre_travel = TorreTravel.find(params[:id])
  end
end
