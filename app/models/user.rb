class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :credit_cards
  has_many :purchases
  has_many :comments
  has_many :user_identifications
  has_many :products
  validates :nickname, :family_name, :first_name, :family_furigana, :first_furigana, :birth_year, :birth_month, :birth_day,presence: true

end
