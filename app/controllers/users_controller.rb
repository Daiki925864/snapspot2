class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @posts = @user.posts.includes(:user).order("created_at DESC").page(params[:page]).per(6)
  end
end
