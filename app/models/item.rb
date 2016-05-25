class Item < ActiveRecord::Base
    has_many :item_orders
    has_many :orders, through: :item_orders
    has_many :item_carts
    has_many :carts, through: :item_carts
    
    def red_cart
       self.quantity -= 1
       self.save
    end
    
end