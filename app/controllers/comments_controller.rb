class CommentsController < ApplicationController
  def index
    @comments = Comment.order('id desc')
  end

  def create
    @comment = Comment.new comment_params

    if @comment.save
      render json: {status: :ok}
    else
      render json: {status: :error}
    end
  end

  private

  def comment_params
    params.require(:comment).permit!
  end

end