class ApplicationController < ActionController::Base
  before_action :basic_auth
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!
  protect_from_forgery with: :exception
  before_action :registration_check  
  before_action :registration_view_params
  require 'payjp'
  Payjp.api_key=Rails.application.credentials.payjp_secret_key
  # Payjp.api_key=Rails.application.secrets.payjp_secret_key
  # ローカル環境でのテスト

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


  def registration_check
    # ユーザーがログインしている　かつ　登録の画面でない場合　→　中途半端な登録データを削除しroot_pathに移動
    if user_signed_in?
      unless ((controller_name == "phone_number_authorization" && action_name == "new")||(controller_name == "address_registration" && action_name == "new")||(controller_name == "credit_cards" && action_name == "new"))
        if (current_user.phone_number_authorizations.length == 0 || current_user.address_registrations.length == 0 || current_user.credit_cards.length == 0)
          unless (current_user.phone_number_authorizations.length != 0 && current_user.address_registrations.lenght != 0 && current_user.credit_cards.length != 0)
            current_user.destroy
            redirect_to root_path
          end
        end
      end
    end
  end

  def registration_view_params
    @member_information_title = "visited"
    @member_information = "progressed"
  end
end

