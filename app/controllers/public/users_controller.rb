class Public::UsersController < ApplicationController

  # ログイン済ユーザーのみにアクセスを許可する
  before_action :authenticate_user!, except: [:ranking]

  def show
    @user = User.find(params[:id])
  end

  def update
  end

  def follow
    @users = current_user.followed_users.order(:name)
  end

  def block
    @users = current_user.blocked_users.order(:name)
  end

  def my_page
  end

  def ranking
    @users = User.
  end

end
