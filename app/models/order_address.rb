class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code,
                :prefecture_id,
                :city,
                :house_number,
                :building_name,
                :phone_number,
                :user_id,
                :item_id,
                :token

  # バリデーション
  with_options presence: true do
    validates :city, :house_number, :token
  end
  validates :user_id, presence: true
  validates :item_id, presence: true
  validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/, message: "is invalid. Enter it in the format '123-4567'" }
  validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'must be 10 or 11 digits, numeric only' }
  validates :prefecture_id, numericality: { other_than: 0, message: 'must be selected' }

  # 保存する処理
  def save
    return false unless valid?

    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(
      postal_code: postal_code,
      prefecture_id: prefecture_id,
      city: city,
      house_number: house_number,
      building_name: building_name,
      phone_number: phone_number,
      order_id: order.id
    )
  end
end
