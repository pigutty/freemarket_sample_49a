class AddressRegistrationController < ApplicationController
  def new
    @member_information_title = nil
    @member_information = "completed"
    @phone_information = 'completed'
    @address_information_title = "visited"
    @address_information = 'progressed'
  end

  def create
  end
end
