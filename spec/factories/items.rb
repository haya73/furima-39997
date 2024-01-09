FactoryBot.define do
  factory :item do

    item_name            {"食ってみな飛ぶぞ"}
    description          {"有名プロレスラーが絶賛したソフトほたて貝柱。"}
    category_id          {2}
    condition_id         {2}
    delivery_cost_id     {2}
    prefecture_id        {2}
    delivery_day_id      {2}
    price                {555}
    association          :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/test_image.png'), filename: 'test_image.png')
    end
  end
end
