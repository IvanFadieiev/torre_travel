class ImagesController < ActionController::Base
  
  def new
    @image = @torre_travel.imagess.build
    @torre_travel = TorreTravel.find(params[:torre_travel_id])  
  end
  
  def create
    @torre_travel = TorreTravel.find(params[:torre_travel_id])
    @image = @torre_travel.images.build(image_params)
      if @image.save
        redirect_to :back
      else
        render 'new'
      end
  end

  def edit
    @image = Image.find(params[:id])
  end
  def update
    @image = Image.find(params[:id])
    if @image.update(image_params)
       redirect_to torre_travel_path(@image.torre_travel_id), notice: 'Изображение обновлено!!!'
     else
       render 'edit'
     end
  end
  def destroy
    @image = Image.find(params[:id])
    if @image.destroy
      redirect_to :back, notice: 'Изображение удалено!!!'
    end
  end

  private
  def image_params
    params.require(:image).permit(:description,:image_of_housing)
  end
end