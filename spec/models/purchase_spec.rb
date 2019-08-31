require 'rails_helper'
describe Purchase do
  describe '#create' do
    it "is valid all data" do
      purchase = build(:purchase)
      purchase.valid?
      expect(purchase).to be_valid
    end
  end
end
