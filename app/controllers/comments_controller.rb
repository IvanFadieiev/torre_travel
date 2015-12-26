# comments_controller
class CommentsController < ApplicationController
  before_action :all_comments, only: [:create, :index]
  def create
    @comment = Comment.new(comments_params)
    if valid_captcha?(params[:captcha])
      if @comment.save
        redirect_to :back, notice: "Отзыв был успешно добавлен!"
        AdminMailer.new_comment(@comment).deliver_now
      else
        render 'index'
      end
    else
      flash[:notice]="Не правильно введен код с картинки!"
      render 'index'
    end
  end

  def index
    @comment = Comment.new
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.destroy
      redirect_to :back, notice: "Отзыв был успешно удален!"
    end
  end


  private
  def all_comments
    @comments = Comment.all 
  end

  def comments_params
    params.require(:comment).permit(:name,:body,:email)
  end
end
