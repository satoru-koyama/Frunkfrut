class Public::PostFavoritesController < ApplicationController

  # ログイン済ユーザーのみにアクセスを許可する
  before_action :authenticate_user!

  def create
    @post = Post.find(params[:post_id])
    @post_favorite = PostFavorite.new
    @post_favorite.user_id = current_user.id
    @post_favorite.post_id = params[:post_id]
    @post_favorite.save
  end


  def destroy
    @post = Post.find(params[:post_id])
    @post_favorite = PostFavorite.find_by(user_id: current_user.id, post_id: params[:post_id])
    @post_favorite.destroy
  end

end
