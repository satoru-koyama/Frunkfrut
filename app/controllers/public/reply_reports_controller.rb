class Public::ReplyReportsController < ApplicationController

  # ログイン済ユーザーのみにアクセスを許可する
  before_action :authenticate_user!

  def create
    @reply_report = ReplyReport.new
    @reply_report.user_id = current_user.id
    @reply_report.reply_id = params[:reply_id]
    @reply_report.save
    @reply = Reply.find(params[:reply_id])
  end

  def destroy
    @reply_report = ReplyReport.find_by(user_id: current_user.id, reply_id: params[:reply_id])
    @reply_report.destroy
    @reply = Reply.find(params[:reply_id])
  end

end
