FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.email}
    password              {'1a' + Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    first_name            {"黄"}
    last_name             {"熊"}
    first_name_kana       {"プ"}
    last_name_kana        {"ウ"}
    birthday              {'1145-01-04'}
  end
end