class ApplicationController < ActionController::Base
  before_action :basic_auth
  protect_from_forgery with: :exception
  require 'payjp'
  Payjp.api_key=Rails.application.secrets.payjp_secret_key
  # Payjp.api_key = ENV["SECRET_PAYJP_API_KEY"]
  # ローカル環境ではsecrets.ymlにapiの秘密鍵を置いているが、本番環境では環境変数/etc/envに設定する。

  private
  
  def basic_auth
    if Rails.env.production?
      authenticate_or_request_with_http_basic do |username, password|
        username == Rails.application.credentials.BASIC_AUTH_USER && password == Rails.application.credentials.BASIC_AUTH_PASSWORD
      end
    end
  end
end
