class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def previous
    Post.where("id > ?", self.id).order("id ASC").first
  end

  def next
    Post.where("id < ?", self.id).order("id DESC").first
  end

end
