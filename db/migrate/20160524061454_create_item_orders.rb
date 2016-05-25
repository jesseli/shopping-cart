class CreateItemOrders < ActiveRecord::Migration
  def change
    create_table :item_orders do |t|
      t.integer :quantity
      t.references :item, index: true
      t.references :order, index: true

      t.timestamps null: false
    end
  end
end
