class CommercialsController < ApplicationController
  before_action :find_commercial, only: [:edit, :update, :destroy, :show]
  def new
    if signed_in?
      @commercial = Commercial.new
    else
      redirect_to :root
    end
  end

  def create
    @commercial = Commercial.new(commercial_params)
    if signed_in?
      if @commercial.save
        redirect_to commercials_path, notice: "Реклама успешно сохранена!"
      else
        render 'new', notice: "Что то пошло не так, введите данные еще раз!"
      end
    else
      redirect_to :root
    end
  end

  def show
  end

  def edit
  end

  def update
    if signed_in?
      if @commercial.update(commercial_params)
        redirect_to commercials_path, notice: "Реклама успешно обновлена!"
      else
        render 'edit'
      end
    else
      redirect_to :root
    end
  end

  def index
    if signed_in?
      @commercials = Commercial.all
    else
      redirect_to :root
    end
  end

  def destroy
    if signed_in?
      if @commercial.destroy
        redirect_to commercials_path, notice: "Реклама успешно удалена!"
      else
        redirect_to commercials_path
      end
    else
      redirect_to :root
    end
  end

  private

  def commercial_params
    params.require(:commercial).permit(:body, :phone, :email, :address)
  end

  def find_commercial
    @commercial = Commercial.find(params[:id])
  end
end
