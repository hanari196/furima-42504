require 'active_hash'

class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_method
  belongs_to :prefecture
  belongs_to :delivery_time
  belongs_to :user

  has_one_attached :image
  has_one :order

    def sold_out?
      order.present?
    end

  with_options presence: true do
    validates :image
    validates :title
    validates :product_contents
    validates :price

    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :condition_id
      validates :shipping_method_id
      validates :prefecture_id
      validates :delivery_time_id
    end
  end
  
  validates :price,
            numericality: { only_integer: true,
                            greater_than_or_equal_to: 300,
                            less_than_or_equal_to: 9_999_999 }
end