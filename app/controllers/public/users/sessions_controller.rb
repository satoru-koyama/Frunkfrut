# frozen_string_literal: true

class Public::Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # [目的] ユーザーのログインページに遷移するcustomers#newアクションが実行される前に、管理者のログインが行われていれば、管理者をログアウトさせる。
  # [方法] before_actionを使って、newアクションが実行される前に、管理者がログインしていれば管理者をログアウトさせるアクションを実行させる。
  # before_action :sign_out_admin, only: [:new]

  # def sign_out_admin
  #   if admin_signed_in?
  #     # [目的] current_adminログアウトさせる
  #     # sign_out_and_redirect(resource_or_scope) => Object
  #     # [解説] Sign out a user and tries to redirect to the url specified by after_sign_out_path_for.
  #     sign_out_and_redirect(current_admin)
  #   end
  # end

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

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
