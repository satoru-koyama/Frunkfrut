class Public::UsersController < ApplicationController

  # ログイン済ユーザーのみにアクセスを許可する
  before_action :authenticate_user!, except: [:ranking]

  def show
    @user = User.find(params[:id])
  end

  def update
  end

  def follow
  end

  def block
  end

  def my_page
  end

  def ranking
  end

end
