class Public::ReplyFavoritesController < ApplicationController

  # ログイン済ユーザーのみにアクセスを許可する
  before_action :authenticate_user!

  def create
    @reply_favorite = ReplyFavorite.new
    @reply_favorite.user_id = current_user.id
    @reply_favorite.reply_id = params[:reply_id]
    @reply_favorite.save
    @reply = Reply.find(params[:reply_id])
  end

  def destroy
    @reply_favorite = ReplyFavorite.find_by(user_id: current_user.id, reply_id: params[:reply_id])
    @reply_favorite.destroy
    @reply = Reply.find(params[:reply_id])
  end

end
