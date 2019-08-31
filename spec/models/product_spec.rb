require 'rails_helper'
describe Product do
  describe '#create' do
    it "is valid all data" do
      product = build(:product)
      product.valid?
      expect(product).to be_valid
    end
    it "is invalid without a name" do
      product = build(:product,name:nil)
      product.valid?
      expect(product.errors[:name]).to include("を入力してください")
    end
    it "is invalid without a description" do
      product = build(:product,description:nil)
      product.valid?
      expect(product.errors[:description]).to include("を入力してください")
    end
    it "is invalid without a size" do
      product = build(:product,size_id:nil)
      product.valid?
      expect(product.errors[:size_id]).to include("を入力してください")
    end
    it "is invalid without a status" do
      product = build(:product,status_id:nil)
      product.valid?
      expect(product.errors[:status_id]).to include("を入力してください")
    end
    it "is invalid without a shipping_method" do
      product = build(:product,shipping_method_id:nil)
      product.valid?
      expect(product.errors[:shipping_method_id]).to include("を入力してください")
    end
    it "is invalid without a shipping_fee" do
      product = build(:product,shipping_fee_id:nil)
      product.valid?
      expect(product.errors[:shipping_fee_id]).to include("を入力してください")
    end
    it "is invalid without a shipping_date" do
      product = build(:product,shipping_date_id:nil)
      product.valid?
      expect(product.errors[:shipping_date_id]).to include("を入力してください")
    end
    it "is invalid without a price" do
      product = build(:product,price:nil)
      product.valid?
      expect(product.errors[:price]).to include("を入力してください")
    end
    it "is invalid without a category_grandparent" do
      product = build(:product,category_grandparent_id:nil)
      product.valid?
      expect(product.errors[:category_grandparent_id]).to include("を入力してください")
    end
    it "is invalid without a category_parent" do
      product = build(:product,category_parent_id:nil)
      product.valid?
      expect(product.errors[:category_parent_id]).to include("を入力してください")
    end
    it "is invalid without a category" do
      product = build(:product,category_id:nil)
      product.valid?
      expect(product.errors[:category_id]).to include("を入力してください")
    end
    it "is invalid without a prefecture" do
      product = build(:product,prefecture_id:nil)
      product.valid?
      expect(product.errors[:prefecture_id]).to include("を入力してください")
    end
    it "is invalid without a purchase_status" do
      product = build(:product,purchase_status_id:nil)
      product.valid?
      expect(product.errors[:purchase_status_id]).to include("を入力してください")
    end
  end
end