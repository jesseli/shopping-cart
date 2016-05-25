class ItemOrderController < ApplicationController
  def index
   @item = params[:cart].keys
   @quantity = params[:cart].values
  end
  
    def new
      @cart = params[:cart]
    # ActiveResource
      @cartitem = Item_order.new(params[:cart])
    end
end
  

