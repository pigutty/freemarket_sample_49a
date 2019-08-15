class PhoneNumberAuthorizationController < ApplicationController
  def new
    binding.pry
    if (user_signed_in? && current_user.phone_number_authorizations.length == 0 && current_user.address_registrations.length ==0 && current_user.credit_cards.length ==0)
      @member_information_title = nil
      @member_information = "completed"
      @phone_information_title = "visited"
      @phone_information = 'progressed'
      @phone = PhoneNumberAuthorization.new
    else
      redirect_to root_path
    end
  end

  def create
    binding.pry
    PhoneNumberAuthorization.create(phone_params)
    redirect_to controller:"address_registration", action:'new'
  end

  private
  def phone_params
    params.require(:phone_number_authorization).permit(:telephone).merge(user_id:current_user.id)
  end
end
