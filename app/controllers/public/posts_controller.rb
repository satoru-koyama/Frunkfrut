class Public::PostsController < ApplicationController

  def create
    post = Post.new(post_params)
    post.user_id = current_user.id
    post.save
    redirect_to posts_path, method: :get
  end

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @comments = Comment.all
  end

  def update
  end

  def delete
  end

  private
  def post_params
    params.require(:post).permit(:text, :post_image)
  end

end
