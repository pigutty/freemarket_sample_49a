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
    prefecture_id           {1}
    purchase_status_id      {1}
  end
end