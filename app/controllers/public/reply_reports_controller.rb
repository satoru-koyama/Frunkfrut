class Public::ReplyReportsController < ApplicationController

  def create
    @reply_report = ReplyReport.new
    @reply_report.user_id = current_user.id
    @reply_report.reply_id = params[:reply_id]
    @reply_report.save
    redirect_to request.referer
  end

  def destroy
    @reply_report = ReplyReport.find(params[:id])
    @reply_report.destroy
    redirect_to request.referer
  end

end
