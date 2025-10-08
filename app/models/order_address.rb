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
    validates :postal_code, presence: { message: "can't be blank" }
    validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/, message: 'Input correctly' }

    validates :prefecture_id, numericality: { other_than: 0, message: 'Select' }

    validates :city, presence: { message: "can't be blank" }
    validates :house_number, presence: { message: "can't be blank" }

    validates :phone_number, presence: { message: "can't be blank" }
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'Input only number' }

    validates :token, presence: { message: "can't be blank" }
    validates :user_id, presence: true
    validates :item_id, presence: true

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
