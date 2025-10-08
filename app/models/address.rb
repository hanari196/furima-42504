class Address < ApplicationRecord
  belongs_to :order

  with_options presence: { message: "can't be blank" } do
    validates :postal_code, :city, :house_number, :phone_number
  end
  validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/, message: "Input correctly" }
  validates :phone_number, format: { with: /\A\d{10,11}\z/, message: "Input only number" }
  validates :prefecture_id, numericality: { other_than: 0, message: "Select" }
end
