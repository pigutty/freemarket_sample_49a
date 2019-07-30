class PurchasesController < ApplicationController
  def new
    @product = Product.find(params[:product_id].to_i)
    @user = User.find(1)
    @customer = Payjp::Customer.retrieve(@user.customer_id)
    card = @customer.cards.data[0]
    @brand = card.brand
    @last4 = card.last4
    @month = card.exp_month
    @year = card.exp_year
  end

  def create
  end
end
