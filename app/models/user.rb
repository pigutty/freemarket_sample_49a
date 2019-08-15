class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :credit_cards,dependent: :destroy
  has_many :purchases,dependent: :destroy
  has_many :user_identifications,dependent: :destroy
  has_many :phone_number_authorizations,dependent: :destroy
  has_many :address_registrations,dependent: :destroy

  validates :nickname, :family_name, :first_name, :family_furigana, :first_furigana, :birth_year, :birth_month, :birth_day,presence: true
  
end
