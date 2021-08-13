class Public::PostsController < ApplicationController

  # ログイン済ユーザーのみにアクセスを許可する
  before_action :authenticate_user!, except: [:index, :show]

  def create
    post = Post.new(post_params)
    post.user_id = current_user.id
    post.save
    redirect_to posts_path, method: :get
  end

  def index
    start_time = Time.zone.now - ( 60 * 60 * 24 * 3 )
    @posts = Post.where("created_at > ?", start_time ).order(id: :DESC)
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @comments = Comment.all.order(id: :DESC)
  end

  def update
  end

  def delete
    limit_time = Time.zone.now - ( 60 * 60 * 24 * 3 )
    posts = Post.where("created_at < ? AND is_deleted = false", limit_time )
    posts.each do |post|
      post.update(is_deleted: true)
      comments = post.comments
      comments.each do |comments|
        comment.update(is_deleted: true)
        replies = comment.replies
        replies.each do |reply|
          reply.update(is_deleted: true)
        end
      end
    end

  end

  private
  def post_params
    params.require(:post).permit(:text, :image)
  end

end
