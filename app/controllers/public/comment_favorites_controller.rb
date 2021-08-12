class Public::CommentFavoritesController < ApplicationController

  # ログイン済ユーザーのみにアクセスを許可する
  before_action :authenticate_user!

  def create
    @comment_favorite = CommentFavorite.new
    @comment_favorite.user_id = current_user.id
    @comment_favorite.comment_id = params[:comment_id]
    @comment_favorite.save
    redirect_to request.referer
  end

  def destroy
    @comment_favorite = CommentFavorite.find_by(user_id: current_user.id, comment_id: params[:comment_id])
    @comment_favorite.destroy
    redirect_to request.referer
  end

end
