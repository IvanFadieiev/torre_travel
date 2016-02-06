# comments_controller
class CommentsController < ApplicationController
  before_action :all_comments, only: [:create, :index]
  def create
    @comment = Comment.new(comments_params)
    if valid_captcha?(params[:captcha])
      if @comment.save
        redirect_to comments_path, notice: "Отзыв был успешно добавлен!"
        AdminMailer.new_comment(@comment).deliver_now
      else
        flash.now[:notice] = "Возникли ошибки, попробуйте еще раз!"
        render 'index'
      end
    else
      flash[:notice] = "Не правильно введен код с картинки!"
      render 'index'
    end
  end

  def index
    @comment = Comment.new
  end

  private

  def all_comments
    @comments = Comment.paginate(page: params[:page], per_page: 6)
  end

  def comments_params
    params.require(:comment).permit(:name, :body, :email)
  end
end
