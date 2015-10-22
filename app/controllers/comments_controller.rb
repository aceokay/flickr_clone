class CommentsController < ApplicationController
  def new
    @photo = Photo.find(params[:photo_id])
    @comment = Comment.new
  end

  def create
    @photo = Photo.find(params[:photo_id])
    @comment = @photo.comments.new(comment_params)
    if @comment.save
      flash[:success] = "Thanks for your comment"
      redirect_to photo_path(@photo)
    else
      flash[:danger] = "You did it wrong"
      render :new
    end
  end

private
  def comment_params
    params.require(:comment).permit(:user_id, :photo_id, :content)
  end
end
