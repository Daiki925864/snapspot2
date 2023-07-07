class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :search, :tags_index]
  before_action :set_post, only: [:edit, :show, :update, :destroy]
  before_action :move_to_index, only: [:edit, :update, :destroy]
  impressionist :actions => [:show]
  
  def index
    if params[:tag_id].present?
      @posts = Tag.find(params[:tag_id]).posts.order("created_at DESC").page(params[:page]).per(6)
    else
      @posts = Post.all.order("created_at DESC").page(params[:page]).per(6)
    end
  end

  def new
    @post_form = PostForm.new
  end

  def create
    @post_form = PostForm.new(post_form_params)
    if @post_form.valid?
      @post_form.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @comment = Comment.new
    @comments = @post.comments.includes(:user)
    impressionist(@post, nil, unique: [:impressionable_id, :ip_address]) #PV数を取得
  end

  def edit
    # @postから情報をハッシュとして取り出し、@post_formとしてインスタンス生成する
    post_attributes = @post.attributes
    @post_form = PostForm.new(post_attributes)
    @post_form.tag_name = @post.tags.first&.tag_name
  end

  def update
    # paramsの内容を反映したインスタンスを生成する
    @post_form = PostForm.new(post_form_params)

    # 画像を選択し直していない場合は、既存の画像をセットする
    @post_form.image ||= @post.image.blob

    if @post_form.valid?
      @post_form.update(post_form_params, @post)
      redirect_to post_path(@post.id)
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to root_path
  end

  def  most_viewed
    @posts = Post.find(Impression.group(:impressionable_id).order('count(impressionable_id) desc').limit(5).pluck(:impressionable_id))
  end

  def search
    @posts = Post.search(params[:keyword]).page(params[:page]).per(6)
  end

  def search_tag
    return nil if params[:keyword] == ""
    tag = Tag.where(['tag_name LIKE ?', "%#{params[:keyword]}%"] )
    render json:{ keyword: tag }
  end

  def tags_index
    @tags = Tag.all.order("tag_name ASC")
  end

  private

  def post_form_params
    params.require(:post_form).permit(:title, :content, :shooting_date, :address, :tag_name, :image, :latitude, :longitude).merge(user_id: current_user.id)
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def move_to_index
    unless user_signed_in? && current_user == @post.user
      redirect_to action: :index
    end
  end
end
