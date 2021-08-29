class Public::BlockRelationshipsController < ApplicationController

  # ログイン済ユーザーのみにアクセスを許可する
  before_action :authenticate_user!

  def create
    if !BlockRelationship.find_by(block_id: current_user.id, blocked_id: params[:user_id])
      @block_relationship = BlockRelationship.new
      @block_relationship.block_id = current_user.id
      @block_relationship.blocked_id = params[:user_id]
      @block_relationship.save
    end
    @user = User.find(params[:user_id])
  end

  def destroy
    @block_relationship = BlockRelationship.find_by(block_id: current_user.id, blocked_id: params[:user_id])
    @block_relationship.destroy
    @user = User.find(params[:user_id])
  end

end
