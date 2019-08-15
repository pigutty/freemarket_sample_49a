class CreditCardsController < ApplicationController
  def new
    binding.pry
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
    create_token(credit_card_params)
    current_user.customer_id = @customer.id
    current_user.save
    CreditCard.create(token_id: @token_id, user_id: current_user.id)
    redirect_to registration_check_index_path
  end

  private
  def credit_card_params
    params.permit(:number,:cvc,:user_id).merge(params.require(:select).permit(:exp_month,:exp_year))
  end

  def create_token(credit_card_params)
    @token = Payjp::Token.create({
      :card => {
      :number => credit_card_params[:number],
      :cvc => credit_card_params[:cvc],
      :exp_month => credit_card_params["exp_month(2i)"],
      :exp_year => credit_card_params["exp_year(1i)"]
    }},
    {
      'X-Payjp-Direct-Token-Generate': 'true'
    })
    @token_id = @token.id
    @customer = Payjp::Customer.create()
    # @customer = Payjp::Customer.retrieve(current_user.customer_id)
    # 顧客IDを事前に作成して、それを取得する場合はこちらのコードを使用する
    @customer.cards.create(card:@token_id)
  end


end
