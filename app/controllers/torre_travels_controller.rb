# clss Torre travel
class TorreTravelsController < ApplicationController
  before_action :set_torre_travel, only: [:show]
  before_action :all_torre_travels, only: [:index, :all_housings]

  def index
    @slyders = Slyder.all
  end

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
