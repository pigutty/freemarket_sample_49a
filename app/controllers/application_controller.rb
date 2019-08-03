class ApplicationController < ActionController::Base
  before_action :basic_auth
  protect_from_forgery with: :exception

  private
  
  def basic_auth
    if Rails.env.production?
      authenticate_or_request_with_http_basic do |username, password|
        username == Rails.application.credentials.config[:BASIC_AUTH_USER] && password == Rails.application.credentials.config[:BASIC_AUTH_PASSWORD]
      end
    end
  end
end
