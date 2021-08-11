class Public::RepliesController < ApplicationController

  def create
    reply = Reply.new(reply_params)
    reply.user_id = current_user.id
    reply.comment_id = params[:comment_id]
    reply.save
    redirect_to post_comment_path(post_id: reply.comment.post_id ,id: reply.comment_id), method: :get
  end

  def update
  end

  def delete
  end

  private
  def reply_params
    params.require(:reply).permit(:text, :reply_image)
  end

end
