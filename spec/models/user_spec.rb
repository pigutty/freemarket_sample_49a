require 'rails_helper'
describe User do
  describe '#create' do
    it "is invalid without a nickname" do
      user = User.new(
        nickname:"",
        email:"kkk@gmail.com",
        password:"00000000",
        password_confirmation: "00000000",
        family_name:"手酢都",
        first_name:"太郎",
        family_furigana:"テスト",
        first_furigana:"タロウ",
        birth_year:1990,
        birth_month:1,
        birth_day:1
      )
      user.valid?
      expect(user.errors[:nickname]).to include("を入力してください")
    end
  end
end
