class PurchasesController < ApplicationController
  before_action :target_product
  before_action :purchase_status_check 
  def new
    if current_user != @product.user
      if current_user.credit_cards.length != 0
        @customer = Payjp::Customer.retrieve(current_user.customer_id)
        card = @customer.cards.data[0]
        # カードが複数ある場合にどのカードを選ぶのかは問題だが、とりあえず一番目
        @brand = card.brand
        @last4 = card.last4
        @month = card.exp_month
        @year = card.exp_year
      else
        redirect_to mypage_card_index_path
      end
    else
      redirect_to root_path
    end
  end

  def create
    unless @product.purchase_status_id == 1
      redirect_to root_path
    end
    if current_user != @product.user 
      charge = Payjp::Charge.create(
        amount: @product.price,
        customer: current_user.customer_id,
        currency: 'jpy',
        )
      Purchase.create(purchase_id:charge.id,product_id: params[:product_id],user_id:current_user.id)
      @product.update(purchase_status_id: 2)
    end
    redirect_to  root_path
  end

  private

  def purchase_params
    params.permit(:product_id).merge(current_user.id,current_user.customer_id)
  end

  def target_product
    @product = Product.find(params[:product_id])
  end

  def purchase_status_check 
    unless @product.purchase_status_id == 1
      redirect_to root_path
    end
  end
end
