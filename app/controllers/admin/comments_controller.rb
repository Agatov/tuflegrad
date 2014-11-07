class Admin::CommentsController < AdminController
  def index
    @comments = Comment.order('id desc')
  end

  def show
    @comment = Comment.find params[:id]
  end

  def edit
    @comment = Comment.find params[:id]
  end

  def update
    @comment = Comment.find params[:id]
    @comment.update_attributes comment_params
    redirect_to :back
  end

  def approve
    Comment.find(params[:id]).update_attributes(moderated: true)
    redirect_to :back
  end

  def destroy
    @comment = Comment.find params[:id]
    @comment.destroy
    redirect_to :back
  end

  private

  def comment_params
    params.require(:comment).permit!
  end
end