class Public::CommentsController < ApplicationController

  def create
    comment = Comment.new(comment_params)
    comment.user_id = current_user.id
    comment.post_id = params[:post_id]
    comment.save
    redirect_to post_path(comment.post_id), method: :get
  end

  def show
  end

  def update
  end

  def delete
  end

  private
  def comment_params
    params.require(:comment).permit(:text, :comment_image)
  end


end
