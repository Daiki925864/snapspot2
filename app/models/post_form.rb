class PostForm
  include ActiveModel::Model

  #PostFormクラスのオブジェクトがPostモデルの属性を扱えるようにする
  attr_accessor(
    :title, :content, :shooting_date,
    :address, :latitude, :longitude, :image,
    :id, :created_at, :updated_at, :user_id,
    :tag_name
  )

  with_options presence: true do
    validates :image
    validates :title
    validates :content
    validates :shooting_date
  end

  def save
    post = Post.create(title: title, content: content, shooting_date: shooting_date, address: address, latitude: latitude, longitude: longitude, image: image, user_id: user_id)
    if tag_name.present?
      tag = Tag.where(tag_name: tag_name).first_or_initialize
      tag.save
      PostTagRelation.create(post_id: post.id, tag_id: tag.id)
    end
  end

  def update(params, post)
    post.update(params)
  end
end