class Public::PostReportsController < ApplicationController

  # ログイン済ユーザーのみにアクセスを許可する
  before_action :authenticate_user!

  def create
    @post_report = PostReport.new
    @post_report.user_id = current_user.id
    @post_report.post_id = params[:post_id]
    @post_report.save
    redirect_to request.referer
  end

  def destroy
    @post_report = PostReport.find_by(user_id: current_user.id, post_id: params[:post_id])
    @post_report.destroy
    redirect_to request.referer
  end

end
