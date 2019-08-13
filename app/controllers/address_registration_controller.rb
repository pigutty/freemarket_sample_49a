class AddressRegistrationController < ApplicationController
  def new
    @member_information_title = nil
    @member_information = "completed"
    @phone_information = 'completed'
    @address_information_title = "visited"
    @address_information = 'progressed'
    @address = AddressRegistration.new
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
