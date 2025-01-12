class CreateShippings < ActiveRecord::Migration[7.0]
  def change
    create_table :shippings do |t|
      t.string :post_code, null: false
      t.integer :prefecture_id, null: false
      t.string :municipality, null: false
      t.string :house_number, null: false
      t.string :building_nam
      t.string :phone_number, null: false

      t.timestamps
    end
  end
end
