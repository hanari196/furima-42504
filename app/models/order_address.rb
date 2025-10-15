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

  # 必須項目チェック
  with_options presence: { message: "can't be blank" } do
    validates :postal_code
    validates :city
    validates :house_number
    validates :phone_number
    validates :user_id
    validates :item_id
    validates :token
  end

  # 郵便番号
  validates :postal_code,
            format: { with: /\A\d{3}-\d{4}\z/, message: 'is invalid. Enter it as follows (e.g. 123-4567)' }

  # 都道府県
  validates :prefecture_id,
            numericality: { other_than: 1, message: "can't be blank" }

  # 電話番号
  validates :phone_number,
            format: { with: /\A\d+\z/, message: 'is invalid. Input only number' }
  validates :phone_number,
            length: { minimum: 10, maximum: 11, message: 'is too short' }

  # 保存処理
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
