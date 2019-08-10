class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :credit_cards
  has_many :purchases
  validates :nickname, presence: true
  validates :family_name, presence: true
  validates :first_name, presence: true
  validates :family_furigana, presence: true
  validates :first_furigana, presence: true
  validates :birth_year, presence: true
  validates :birth_month, presence: true
  validates :birth_day, presence: true

end
