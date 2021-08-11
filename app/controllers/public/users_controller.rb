class Public::UsersController < ApplicationController

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
