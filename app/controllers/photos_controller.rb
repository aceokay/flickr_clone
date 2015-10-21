class PhotosController < ApplicationController
  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(photo_params)
    @photo[:user_id] = current_user.id
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
