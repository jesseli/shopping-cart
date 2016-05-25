class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
      t.references :shopper, index: true

      t.timestamps null: false
    end
  end
end
