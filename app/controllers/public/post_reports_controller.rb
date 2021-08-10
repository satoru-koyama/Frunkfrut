class Public::PostReportsController < ApplicationController

  def create
    @post_report = PostReport.new
    @post_report.user_id = current_user.id
    @post_report.post_id = params[:post_id]
    @post_report.save
    redirect_to posts_path, method: :get
  end

  def destroy
    @post_report = PostReport.find(params[:id])
    @post_report.destroy
    redirect_to posts_path, method: :get
  end

end
