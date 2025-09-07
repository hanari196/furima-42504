class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :shipping_method
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :delivery_time
end
