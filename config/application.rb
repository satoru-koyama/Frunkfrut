require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Frunkfrut
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # タイムゾーンを日本時間に設定
    config.time_zone = 'Asia/Tokyo'


    # デバイスのエラーメッセージを日本語にするために記述
    # デフォルトのロケールを日本（ja）に設定
    config.i18n.default_locale = :ja

    # オートロード対象となるパスの追加
    # Wheneverからlib/tasksを呼び出せるようにパスを通す。
    config.autoload_paths += Dir["#{config.root}/lib/**/"]
    config.eager_load_paths += Dir["#{config.root}/lib/**/"]

    # # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
