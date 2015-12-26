class ImagesController < ActionController::Base
  before_action :find_image, only: [:update, :destroy]
  def new
      @image = @torre_travel.imagess.build
      @torre_travel = TorreTravel.find(params[:torre_travel_id])  
  end
  
  def create
    @torre_travel = TorreTravel.find(params[:torre_travel_id])
    @image = @torre_travel.images.build(image_params)
      if @image.save
        redirect_to :back, notice: 'Изображение добавлено!!!'
      else
        render 'new'
      end
  end

  def destroy
    if @image.destroy
      redirect_to :back, notice: 'Изображение удалено!!!'
    end
  end

  private
  def find_image
    @image = Image.find(params[:id])
  end

  def image_params
    params.require(:image).permit(:description,:image_of_housing)
  end
end