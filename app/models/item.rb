class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :shipping_method
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :delivery_time

#画像１枚添付
validates :image,presence: true

#商品名と説明必要
validates :name,presence: true
validates :description, presence: true

#ActiveHashの選択が「---」以外(idが1以外)であること
with_options numericality: { other_than: 1, message: "を選択してください" } do
  validates :category_id
  validates :condition_id
  validates :shipping_method_id
  validates :prefecture_id
  validates :delivery_time_id
end

#価格（300~9,999,999、整数のみ）
validates :price, presence: true,
                  numericality: { only_integer:true,
                                  greater_than_or_equal_to: 300,
                                  less_than_or_equal_to: 9_999_999,
                                  message: "は¥300〜¥9,999,999の間で入力してください" }

end