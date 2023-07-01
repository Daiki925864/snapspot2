class PostForm
  include ActiveModel::Model

  #PostFormクラスのオブジェクトがPostモデルの属性を扱えるようにする
  attr_accessor (:title, :content, :shooting_date,
                  :address, :latitude, :longitude, :image, :user_id)

  with_options presence: true do
    validates :image
    validates :title
    validates :content
    validates :shooting_date
  end
end