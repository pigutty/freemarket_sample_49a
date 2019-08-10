class PurchasesController < ApplicationController
  def new
    @product = Product.find(params[:product_id])
    @user = User.find(1)
    # ユーザー登録終了後は@userはcurrent_userに直す
    @customer = Payjp::Customer.retrieve(@user.customer_id)
    card = @customer.cards.data[0]
    # カードが複数ある場合にどのカードを選ぶのかは問題だが、とりあえず一番目
    @brand = card.brand
    @last4 = card.last4
    @month = card.exp_month
    @year = card.exp_year
  end

  def create
    @product = Product.find(params[:product_id])
    @user = User.find(1)
    charge = Payjp::Charge.create(
      amount: @product.price,
      customer: @user.customer_id,
      currency: 'jpy',
    )
    Purchase.create(purchase_id:charge.id,product_id: params[:product_id],user_id:@user.id)
    redirect_to root_path
  end

  private

  def purchase_params
    params.permit(:product_id).merge(@user.id,@user.customer_id)
  end
end
