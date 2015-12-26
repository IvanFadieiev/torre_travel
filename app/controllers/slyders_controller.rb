class SlydersController < ApplicationController
  before_action :find_slyder, only: [:edit, :update, :destroy]
  def new
    if signed_in?
      @slyder = Slyder.new
      @slyders = Slyder.all
    else
      redirect_to :root
    end
  end
  
  def create 
    @slyder = Slyder.create(slyder_params)
    if signed_in?
      if @slyder.save
        redirect_to :back, notice: "Слайдер удачно сохранено!!!"
      else
        render 'new'
      end
    else
      redirect_to :root
    end
  end

  def edit
  end

  def update
    if signed_in?
      if @slyder.update(slyder_params)
        redirect_to new_slyder_path, notice: "Слайдер успешно обновлен!!!"
      else
        render 'edit'
      end
    else
      redirect_to :root
    end
  end

  def destroy
    if signed_in?
      if @slyder.destroy
        redirect_to :back, notice: 'Слайдер удален!!!'
      end
    else
      redirect_to :root
    end
  end
    
  def all
    @slyders = Slyder.all
  end
  
  private
  def find_slyder
    @slyder = Slyder.find(params[:id])
  end

  def slyder_params
    params.require(:slyder).permit(:description, :poster)
  end
end