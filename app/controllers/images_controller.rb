class ImagesController < ActionController::Base
  
  def new
    @image = @torre_travel.imagess.build
    @torre_travel = TorreTravel.find(params[:torre_travel_id])  
  end
  
  def create
    @torre_travel = TorreTravel.find(params[:torre_travel_id])
    @image = @torre_travel.images.build(image_params)
      if @image.save
        redirect_to :back #all_types_path
      else
        render 'new'
      end
  end

  def edit
    
  end
  def update
    
  end
  def destroy
    
  end

  private
  def image_params
    params.require(:image).permit(:description)
  end
end