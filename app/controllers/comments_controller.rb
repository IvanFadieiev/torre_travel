# comments_controller
class CommentsController < ApplicationController
  before_action :all_comments, only: [:create, :index]
  def create
    @comment = Comment.create(comments_params)
    if @comment.save
      redirect_to :back
    else
      render 'index'
    end
  end

  def index
    @comment = Comment.new
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.destroy
      redirect_to :back, notice: "Comment was destroyed"
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
