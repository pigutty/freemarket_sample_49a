class UserIdentification < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to :user

  VALID_POSTAL_REGEX = /\A\d{3}[-]\d{4}$|^\d{3}[-]\d{2}$|^\d{3}$|^\d{5}$|^\d{7}\z/
  validates :post_number, presence: true, format: {with: VALID_POSTAL_REGEX}
end

