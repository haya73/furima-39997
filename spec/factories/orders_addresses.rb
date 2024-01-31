FactoryBot.define do
  factory :orders_addresses do
    post_code { '123-4567' }
    prefecture_id { 2 }
    city { '志布志市志布志町志布志' }
    address { 'おもちゃのまち1-1' }
    building { 'イボ島' }
    telephone_number { '09011111111' }
    item_id { '1' }
    token {"tok_abcdefghijk00000000000000000"}
  end
end
