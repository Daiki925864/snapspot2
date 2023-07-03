class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :search]
  before_action :set_post, only: [:edit, :show, :update, :destroy]
  before_action :move_to_index, except: [:index, :show, :new, :create, :search]
  
  def index
    @posts = Post.all.order("created_at DESC")
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
  end

  def edit
    # @postから情報をハッシュとして取り出し、@post_formとしてインスタンス生成する
    post_attributes = @post.attributes
    @post_form = PostForm.new(post_attributes)
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

  def search
    @posts = Post.search(params[:keyword])
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
