class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
  validates :image
  validates :title
  validates :content
  validates :shooting_date
  end

end
