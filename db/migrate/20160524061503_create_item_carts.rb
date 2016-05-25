class CreateItemCarts < ActiveRecord::Migration
  def change
    create_table :item_carts do |t|
      t.integer :quantity
      t.references :item, index: true
      t.references :cart, index: true

      t.timestamps null: false
    end
  end
end
