class SlydersController < ApplicationController
  def new
    @slyder = Slyder.new
    @slyders = Slyder.all
  end
  
  def create 
    @slyder = Slyder.create(slyder_params)
    if @slyder.save
      redirect_to :back, notice: "Слайдер удачно сохранено!!!"
    else
      render 'new'
    end
  end

  def edit
    @slyder = Slyder.find(params[:id])
  end

  def update
    @slyder = Slyder.find(params[:id])
    if @slyder.update(slyder_params)
      redirect_to new_slyder_path, notice: "Слайдер успешно обновлен!!!"
    else
      render 'edit'
    end
  end

  def destroy
  @slyder = Slyder.find(params[:id])
    if @slyder.destroy
      redirect_to :back, notice: 'Слайдер удален!!!'
    end
  end
    
  private
  def slyder_params
    params.require(:slyder).permit(:description, :poster)
  end
end