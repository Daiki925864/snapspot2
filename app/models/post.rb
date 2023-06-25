class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
  validates :image
  validates :title
  validates :content
  validates :shooting_date
  end

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
