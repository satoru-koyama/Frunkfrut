class Public::UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def update
    @user = current_user
    @user.update(user_params)
  end

  def follow
    @users = current_user.followed_users.order(:name)
  end

  def block
    @users = current_user.blocked_users.order(:name)
  end

  def my_page
    @user = current_user
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :nickname, :image, :profile)
  end

end
