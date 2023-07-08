class TagsController < ApplicationController
  def index
    @tags = Tag.all.order("tag_name ASC")
  end
end