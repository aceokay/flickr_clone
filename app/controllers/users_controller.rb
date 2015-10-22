class UsersController < ApplicationController
  def show
    @user = User.find(current_user.id)
    @users = User.all
    @photos = Photo.all
    @comments = Comment.all
    @tags = Tag.all
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    flash[:danger] = "User successfully deleted"
    redirect_to user_path(current_user)
  end

  def update
    @user = User.find(params[:id])
    if @user.admin
      @user.remove_admin
      @user.save
      flash[:success] = "#{@user.user_name} is no longer an admin"
      redirect_to user_path(current_user)
    else
      @user.make_user_admin
      @user.save
      redirect_to user_path(current_user)
      flash[:success] = "#{@user.user_name} is now an admin"
    end
  end
end
