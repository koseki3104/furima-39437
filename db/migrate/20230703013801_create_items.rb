class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|

      t.string :product_name,                null: false, default: ""
      t.text :product_description,           null: false, default: ""
      t.integer :category_id,                null: false
      t.integer :condition_id,               null: false 
      t.integer :shipping_cost_id,           null: false
      t.integer :prefecture_id,              null: false
      t.integer :shipping_duration_id,       null: false
      t.integer   :price,                    null: false
      t.integer   :user,                     null: false, foreign_key: true
      t.timestamps
    end
  end
end