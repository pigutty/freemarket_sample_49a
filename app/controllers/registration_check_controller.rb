class RegistrationCheckController < ApplicationController
  def index
    if (user_signed_in? && current_user.phone_number_authorizations.length != 0 && current_user.address_registrations.length !=0 && current_user.credit_cards.length !=0)        
      @member_information_title = nil
      @member_information = "completed"
      @phone_information = 'completed'
      @address_information = 'completed'
      @credit_information = 'completed'
      @registration_check_title = 'visited'
      @registration_check = 'progressed'
    else
      redirect_to root_path
    end
  end
end
