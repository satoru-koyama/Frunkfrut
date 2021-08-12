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
    @replies = Reply.all
  end

  def update
  end

  def delete
  end

  private
  def comment_params
    params.require(:comment).permit(:text, :image)
  end


end
