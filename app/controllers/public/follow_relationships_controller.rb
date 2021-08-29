class Public::FollowRelationshipsController < ApplicationController

  # ログイン済ユーザーのみにアクセスを許可する
  before_action :authenticate_user!

  def create
    if !FollowRelationship.find_by(follow_id: current_user.id, followed_id: params[:user_id])
      @follow_relationship = FollowRelationship.new
      @follow_relationship.follow_id = current_user.id
      @follow_relationship.followed_id = params[:user_id]
      @follow_relationship.save
    end
    @user = User.find(params[:user_id])
  end

  def destroy
    @follow_relationship = FollowRelationship.find_by(follow_id: current_user.id, followed_id: params[:user_id])
    @follow_relationship.destroy
    @user = User.find(params[:user_id])
  end

end
