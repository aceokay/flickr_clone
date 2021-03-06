class PhotosController < ApplicationController
  def new
    @photo = Photo.new
  end

  def show
    @photo = Photo.find(params[:id])
  end

  def destroy
    photo = Photo.find(params[:id])
    photo.comments.each do |comment|
      comment.destroy
    end
    photo.destroy
    redirect_to home_index_path
  end

  def create
    @photo = Photo.new(photo_params)
    @photo[:user_id] = current_user.id
    params[:photo][:tag_ids].each do |tag_id|
      if tag_id != ""
        @photo.tags.push(Tag.find(tag_id))
      end
    end
    if @photo.save
      flash[:succes] = "Successfully added!"
      redirect_to home_index_path
    else
      flash[:danger] = "There was a problem"
      render :new
    end
  end

private
  def photo_params
    params.require(:photo).permit(:file, :user_id)
  end
end
