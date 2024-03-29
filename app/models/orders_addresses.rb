class OrdersAddresses
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city, :address, :building,
                :telephone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, numericality: {other_than: 1, message: "can't be blank"}
    validates :telephone_number, format: {with: /\A\d{10,11}\z/, message: "は10桁以上11桁以内の数字で入力してください"}
    validates :user_id, :item_id, :city, :address, :token

  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)

    # donation_idには、変数donationのidと指定する
    Address.create(
      post_code: post_code, 
      prefecture_id: prefecture_id, 
      city: city, 
      address: address, 
      building: building, 
      telephone_number: telephone_number,
      order_id: order.id
    )
  end
end