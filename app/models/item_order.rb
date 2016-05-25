class ItemOrder < ActiveRecord::Base
  belongs_to :item
  belongs_to :order
  
  def self.add_order(item, quantity)
    self.quantity = quantity
    self.item_id = item
    self.save
  end
        
  
  
  
end
