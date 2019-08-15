class AddressRegistrationController < ApplicationController
  def new
    if (user_signed_in? && current_user.phone_number_authorizations.length != 0 && current_user.address_registrations.length ==0 && current_user.credit_cards.length ==0)
      @member_information_title = nil
      @member_information = "completed"
      @phone_information = 'completed'
      @address_information_title = "visited"
      @address_information = 'progressed'
      @address = AddressRegistration.new
    else
      redirect_to root_path
    end
  end

  def create
    AddressRegistration.create(address_params)
    redirect_to controller:'credit_cards',action:"new"
  end

  private 
  def address_params
    params.require(:address_registration).permit(:family_name,:first_name,:family_furigana,:first_furigana,:postal_code,:prefecture_id,:city,:block,:building,:phone_number).merge(user_id: current_user.id)
  end
end
