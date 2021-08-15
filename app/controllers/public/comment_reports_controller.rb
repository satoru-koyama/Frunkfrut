class Public::CommentReportsController < ApplicationController

  # ログイン済ユーザーのみにアクセスを許可する
  before_action :authenticate_user!

  def create
    @comment = Comment.find(params[:comment_id])
    @comment_report = CommentReport.new
    @comment_report.user_id = current_user.id
    @comment_report.comment_id = params[:comment_id]
    @comment_report.save
  end

  def destroy
    @comment = Comment.find(params[:comment_id])
    @comment_report = CommentReport.find_by(user_id: current_user.id, comment_id: params[:comment_id])
    @comment_report.destroy
  end

end
