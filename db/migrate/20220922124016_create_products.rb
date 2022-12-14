class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :item_name,     null: false
      t.text :explanation,     null: false
      t.integer :category_id,  null: false
      t.integer :situation_id, null: false
      t.integer :delivery_id,  null: false
      t.integer :area_id,      null: false
      t.integer :shipment_id,       null: false
      t.integer :price,        null: false
      t.references :user,      null: false, foreign_key: true

      t.timestamps
    end
  end
end
