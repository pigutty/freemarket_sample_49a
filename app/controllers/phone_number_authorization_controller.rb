class PhoneNumberAuthorizationController < ApplicationController
  def new
    @member_information_title = nil
    @member_information = "completed"
    @phone_information_title = "visited"
    @phone_information = 'progressed'
  end

  def create
  end
end
