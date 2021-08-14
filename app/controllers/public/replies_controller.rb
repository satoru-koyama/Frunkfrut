class Public::RepliesController < ApplicationController

  # ログイン済ユーザーのみにアクセスを許可する
  before_action :authenticate_user!

  def create
    reply = Reply.new(reply_params)
    reply.user_id = current_user.id
    reply.comment_id = params[:comment_id]
    reply.save
    redirect_to post_comment_path(post_id: reply.comment.post_id ,id: reply.comment_id), method: :get
  end

  def update
    @reply = Reply.find(params[:id])
    @reply.update(reply_params)
    redirect_to request.referer
  end

  def delete
    @reply = Reply.find(params[:id])
    @reply.update(is_deleted: true)
    redirect_to request.referer
  end

  private
  def reply_params
    params.require(:reply).permit(:text, :image)
  end

end
