class TagsController < ApplicationController
  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.new(tag_params)
    if @tag.save
      flash[:success] = "You did it!"
      redirect_to user_path(current_user)
    else
      flash[:danger] = "There was a problem"
      render :new
    end
  end

  def destroy
    tag = Tag.find(params[:id])
    tag.destroy
    flash[:success] = "Tag deleted"
    redirect_to user_path(current_user)
  end

private
  def tag_params
    params.require(:tag).permit(:name)
  end
end
