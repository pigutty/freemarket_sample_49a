class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable

  has_many :credit_cards
  has_many :purchases
  has_many :user_identifications

  def self.find_for_oauth(auth)
    user = User.where(uid: auth.uid, provider: auth.provider).first

    unless user
      user = User.new(
        uid:      auth.uid,
        provider: auth.provider,
        email:    auth.info.email,
        password: Devise.friendly_token[0, 20]
      )
      exist_user = User.where(email: user.email).first
      if exist_user
        user = User.new
      else
        user.save(:validate => false)
      end
    end
    user
  end

  has_many :credit_cards,dependent: :destroy
  has_many :purchases,dependent: :destroy
  has_many :user_identifications,dependent: :destroy
  has_many :phone_number_authorizations,dependent: :destroy
  has_many :address_registrations,dependent: :destroy

  validates :nickname, :family_name, :first_name, :family_furigana, :first_furigana, :birth_year, :birth_month, :birth_day,presence: true

end
