FactoryBot.define do
  factory :product do
    name                    {'ピアス'}
    description             {"きゃわ！"}
    size_id                 {1}
    status_id               {1}
    shipping_method_id      {1}
    shipping_fee_id         {1}
    shipping_date_id        {1}
    price                   {300}
    category_grandparent_id {1}
    category_parent_id      {20}
    category_id             {229}
    association             :user
    prefecture_id           {1}
    purchase_status_id      {1}
    created_at              { Faker::Time.between(from: DateTime.now - 2, to: DateTime.now) }
    updated_at              { Faker::Time.between(from: DateTime.now - 2, to: DateTime.now) }
  end
end
