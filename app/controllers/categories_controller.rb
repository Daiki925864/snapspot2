class CategoriesController < ApplicationController

  def index
    @mains = Category.all.order("id ASC").limit(6)
  end

  def show
    @category = Category.find(params[:id])
    @posts = @category.post.includes(:user).order("created_at DESC").page(params[:page]).per(6)
  end

  def search
    item = Category.find(params[:id])
    children_item = item.children
    render json:{ item: children_item }
  end

end
