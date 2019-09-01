class CreditCardsController < ApplicationController
  def new
    if (user_signed_in? && current_user.phone_number_authorizations.length != 0 && current_user.address_registrations.length !=0 && current_user.credit_cards.length ==0)    
      @member_information_title = nil
      @member_information = "completed"
      @phone_information = 'completed'
      @address_information = 'completed'
      @credit_information_title = "visited"
      @credit_information = 'progressed'
    else
      redirect_to root_path
    end
  end

  def create
    @customer = Payjp::Customer.create()
    # @customer = Payjp::Customer.retrieve(current_user.customer_id)
    # 顧客IDを事前に作成して、それを取得する場合はこちらのコードを使用する
    current_user.customer_id = @customer.id
    current_user.save
    CreditCard.create(token_id: params[:token], user_id: current_user.id)
  end

  private
  def credit_card_params
    params.permit(:number,:cvc,:user_id).merge(params.require(:select).permit(:exp_month,:exp_year))
  end

end
