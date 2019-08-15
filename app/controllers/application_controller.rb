class ApplicationController < ActionController::Base
  before_action :basic_auth
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!
  protect_from_forgery with: :exception
  # before_action :registration_check unless :devise_controller? || controller_name == 'phone_number_authorizations' || 'address_registration'|| 'credit_cards' 
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

  def after_sign_up_path_for(resource)
    redirect_to controller:'/phone_number_authorization', action:'new'
  end

  # def registration_check
  #   if current_user != nil && current_user.phone_number_authorization != nil && current_user.address_registration != nil && current_user.credit_card != nil
  #     redirect_to controller: 'devise', action:'destroy'
  #   end
  # end

  def registration_view_params
    @member_information_title = "visited"
    @member_information = "progressed"
  end
end

