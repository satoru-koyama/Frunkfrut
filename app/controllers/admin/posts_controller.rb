class Admin::PostsController < ApplicationController

  # ログイン済管理者のみにアクセスを許可する
  before_action :authenticate_admin!

  def show
  end

end
