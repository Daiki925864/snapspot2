class Post < ApplicationRecord
  is_impressionable counter_cache: true
  belongs_to :user
  belongs_to :category
  has_many :comments, dependent: :destroy
  has_many :post_tag_relations, dependent: :destroy
  has_many :tags, through: :post_tag_relations
  has_one_attached :image

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  def self.search(search)
    if search != ""
      Post.where('title LIKE(?) OR content LIKE(?)', "%#{search}%", "%#{search}%")
    else
      Post.all
    end
  end
end
