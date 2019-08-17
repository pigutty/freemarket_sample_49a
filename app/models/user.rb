class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :credit_cards
  has_many :purchases
  has_many :user_identifications
 
  validates :nickname, :family_name, :first_name, :family_furigana, :first_furigana, :birth_year, :birth_month, :birth_day,presence: true

end
