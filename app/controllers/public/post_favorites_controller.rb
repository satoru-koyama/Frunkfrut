class Public::PostFavoritesController < ApplicationController

  def create
    @post_favorite = PostFavorite.new
    @post_favorite.user_id = current_user.id
    @post_favorite.post_id = params[:post_id]
    @post_favorite.save
    redirect_to request.referer
  end


  def destroy
    @post_favorite = PostFavorite.find_by(user_id: current_user.id, post_id: params[:post_id])
    @post_favorite.destroy
    redirect_to request.referer
  end

end
