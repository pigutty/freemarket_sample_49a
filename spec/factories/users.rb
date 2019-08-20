FactoryBot.define do
  factory :user do
    nickname              {'ichiro'}
    email                 {"kkk@gmail.com"}
    password              {'00000000'}
    password_confirmation {"00000000"}
    family_name           {"手酢都"}
    first_name            {"太郎"}
    family_furigana       {"テスト"}
    first_furigana        {"タロウ"}
    birth_year            {1990}
    birth_month           {1}
    birth_day             {1}
  end
end

