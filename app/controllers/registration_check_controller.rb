class RegistrationCheckController < ApplicationController
  def index
    @member_information_title = nil
    @member_information = "completed"
    @phone_information = 'completed'
    @address_information = 'completed'
    @credit_information = 'completed'
    @registration_check_title = 'visited'
    @registration_check = 'progressed'
  end
end
