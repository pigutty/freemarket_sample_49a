# require 'payjp'
# Payjp.api_key=Rails.application.credentials.payjp_secret_key
# token = Payjp::Token.create({
#   :card => {
#     :number => '4242424242424242',
#     :cvc => '123',
#     :exp_month => '2',
#     :exp_year => '2020'
#   }},
#   {
#     'X-Payjp-Direct-Token-Generate': 'true'
#   } 
# )
# customer = Payjp::Customer.create()
# customer.cards.create(card:token.id)
# charge = Payjp::Charge.create(
#   amount: 1000,
#   customer: customer.id,
#   currency: 'jpy',
# )
# purchase_id = charge.id
# FactoryBot.define do
#   factory :purchase do
#     purchase_id           {purchase_id}
#     evaluation            {1}
#     association           :product
#     association           :user
#     created_at { Faker::Time.between(from: DateTime.now - 2, to: DateTime.now) }
#     updated_at { Faker::Time.between(from: DateTime.now - 2, to: DateTime.now) }
#   end
# end
