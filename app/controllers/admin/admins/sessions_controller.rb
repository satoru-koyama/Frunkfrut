# frozen_string_literal: true

class Admin::Admins::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

# [目的] 管理者のログインページに遷移するadmins#newアクションが実行される前に、ユーザーのログインが行われていれば、ユーザーをログアウトさせる。
# [方法] before_actionを使って、newアクションが実行される前に、ユーザーがログインしていればユーザーをログアウトさせるアクションを実行させる。
  before_action :sign_out_user, only: [:new]


  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  protected

  def sign_out_user
    if user_signed_in?
      # [目的] user_userログアウトさせる
      # sign_out_and_redirect(resource_or_scope) => Object
      # [解説] Sign out a user and tries to redirect to the url specified by after_sign_out_path_for.
      sign_out_and_redirect(current_user)
    end
  end


  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
