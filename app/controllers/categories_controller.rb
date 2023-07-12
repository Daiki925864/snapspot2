class CategoriesController < ApplicationController

  def index
    @parents = Category.all.order("id ASC").limit(6)
  end

  def search
    item = Category.find(params[:id])
    children_item = item.children
    render json:{ item: children_item }
  end

end
