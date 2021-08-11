class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!
  before_action :new_post, if: :user_signed_in?


  protected
  # ログイン先を指定
  def after_sign_in_path_for(resource)
    case resource
    when Admin
      admin_top_path
    when User
      posts_path
    end
  end

  # ログアウト先を指定
  def after_sign_out_path_for(resource_or_scope)
    top_path
  end
  def new_post
    @new_post = Post.new
  end
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

end
