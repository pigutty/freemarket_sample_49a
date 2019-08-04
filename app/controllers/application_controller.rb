class ApplicationController < ActionController::Base
  before_action :basic_auth
  before_action :configure_permitted_parameters, if: :devise_controller?
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

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :email, :family_name, :first_name, :family_furigana, :first_furigana, :birth_year, :birth_month, :birth_day])
  end


end

