class Public::CommentsController < ApplicationController

  # ログイン済ユーザーのみにアクセスを許可する
  before_action :authenticate_user!

  def create
    comment = Comment.new(comment_params)
    comment.user_id = current_user.id
    comment.post_id = params[:post_id]
    comment.save
    redirect_to post_path(comment.post_id), method: :get
  end

  def show
    @comment = Comment.find(params[:id])
    @reply = Reply.new
    @replies = @comment.replies.order(id: :DESC)
  end

  def update
    @comment = Comment.find(params[:id])
    @comment.update(comment_params)
    redirect_to request.referer
  end

  def delete
    @comment = Comment.find(params[:id])
    @comment.update(is_deleted: true)
    redirect_to request.referer
  end

  private
  def comment_params
    params.require(:comment).permit(:text, :image)
  end


end
