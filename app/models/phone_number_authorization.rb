class PhoneNumberAuthorization < ApplicationRecord
  belongs_to :user

  VALID_PHONE_REGEX = /\A\d{10}$|^\d{11}\z/
  validates :telephone, presence: true, format: { with: VALID_PHONE_REGEX }
end
