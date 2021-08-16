class Public::PostsController < ApplicationController

  # ログイン済ユーザーのみにアクセスを許可する
  before_action :authenticate_user!, except: [:index, :show]

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.save
    redirect_to user_root_path
  end

  def index
    if params[:id] == "new"
      start_time = Time.zone.now - ( 60 * 60 * 24 * 3 )
      @posts = Post.where("created_at > ?", start_time ).order(id: :DESC)
      @id = params[:id]

    elsif params[:id] =="followed"
      @posts = current_user.followed_user_posts.order(id: :DESC)
      @id = params[:id]

    elsif params[:id] == "my"
      @posts = current_user.posts.order(id: :DESC)
      @id = params[:id]

    elsif params[:id] == "commented"
      @posts = current_user.commented_posts.order(id: :DESC)
      @id = params[:id]

    elsif request.referer == user_root_path
      start_time = Time.zone.now - ( 60 * 60 * 24 * 3 )
      @posts = Post.where("created_at > ?", start_time ).order(id: :DESC)
      @id = "new"

    elsif request.referer != user_root_path
      start_time = Time.zone.now - ( 60 * 60 * 24 * 3 )
      @posts = Post.where("created_at > ?", start_time ).order(id: :DESC)
      @id = "new"
    end
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @comments = @post.comments.order(id: :DESC)
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to request.referer
  end

  def delete
    @post = Post.find(params[:id])
    @post.update(is_deleted: true)
    redirect_to request.referer
  end

  private
  def post_params
    params.require(:post).permit(:text, :image)
  end

end
