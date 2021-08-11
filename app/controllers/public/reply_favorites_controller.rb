class Public::ReplyFavoritesController < ApplicationController

  def create
    @reply_favorite = ReplyFavorite.new
    @reply_favorite.user_id = current_user.id
    @reply_favorite.reply_id = params[:reply_id]
    @reply_favorite.save
    redirect_to request.referer
  end

  def destroy
    @reply_favorite = ReplyFavorite.find_by(user_id: current_user.id, reply_id: params[:reply_id])
    redirect_to request.referer
  end

end
