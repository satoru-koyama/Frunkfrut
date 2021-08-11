class Public::CommentReportsController < ApplicationController

  def create
    @comment_report = CommentReport.new
    @comment_report.user_id = current_user.id
    @comment_report.comment_id = params[:comment_id]
    @comment_report.save
    redirect_to request.referer
  end

  def destroy
    @comment_report = CommentReport.find_by(user_id: current_user.id, comment_id: params[:comment_id])
    @comment_report.destroy
    redirect_to request.referer
  end

end
