class CreateItems < ActiveRecord::Migration[7.1]
  def change
    create_table :items do |t|
      t.string :title
      t.text :product_contents
      t.integer :category_id
      t.integer :condition_id
      t.integer :shipping_method_id
      t.integer :prefecture_id
      t.integer :delivery_time_id
      t.integer :price
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
