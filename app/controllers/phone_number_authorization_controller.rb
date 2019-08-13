class PhoneNumberAuthorizationController < ApplicationController
  def new
    @member_information_title = nil
    @member_information = "completed"
    @phone_information_title = "visited"
    @phone_information = 'progressed'
    @phone = PhoneNumberAuthorization.new
  end

  def create
    PhoneNumberAuthorization.create(phone_params)
    redirect_to controller:"address_registration", action:'new'
  end

  private
  def phone_params
    params.require(:phone_number_authorization).permit(:telephone).merge(user_id:current_user.id)
  end
end
