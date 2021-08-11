class Public::BlockRelationshipsController < ApplicationController

  def create
    @block_relationship = BlockRelationship.new
    @block_relationship.block_id = current_user.id
    @block_relationship.blocked_id = params[:user_id]
    @block_relationship.save
    redirect_to request.referer
  end

  def destroy
    @block_relationship = BlockRelationship.find_by(block_id: current_user.id, blocked_id: params[:user_id])
    @block_relationship.destroy
    redirect_to request.referer
  end

end
