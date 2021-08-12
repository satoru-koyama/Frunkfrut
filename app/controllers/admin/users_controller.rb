class Admin::UsersController < ApplicationController

  # ログイン済管理者のみにアクセスを許可する
  before_action :authenticate_admin!

  def index
  end

  def show
    @user = User.find(params[:id])
  end

  def block
  end

  def follow
  end

  def delete
    @user = User.find(params[:id])
    @user.update(is_deleted: true)
    redirect_to request.referer
  end

  def undo
    @user = User.find(params[:id])
    @user.update(is_deleted: false)
    redirect_to request.referer
  end


end
