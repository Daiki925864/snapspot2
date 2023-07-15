class TagsController < ApplicationController

  def index
    @tags = Tag.all.order("tag_name ASC")
  end

  def show
    @tag = Tag.find(params[:id])
    @posts = @tag.posts.includes(:user).order("created_at DESC").page(params[:page]).per(6)
  end

end