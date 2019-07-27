class CreditCardsController < ApplicationController
  require 'payjp'
  Payjp.api_key = ENV["SECRET_PAYJP_API_KEY"]
  # 環境変数/etc/envに設定してもらう。
  def new
  end

  def create
    # @user = User.find(params[id:current_user.id]) ユーザー登録後に追記する
    create_token(credit_card_params)
    CreditCard.create(token_id: @token_id, user_id: 1)
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
    # @customer = Payjp::Customer.retrieve(@user.customer_id)
    # @customer.cards.create(card:@token_id)
  end


end
