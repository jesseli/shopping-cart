class CartController < ApplicationController
  
  def add
    id = params[:id]
    #if the cart has already been created, 
    #use the existing cart else create a new cart
    if session[:cart] then
        cart = session[:cart]
    else
        session[:cart] = {}
        cart = session[:cart]
    end
    

    #if the product has already been added to the cart, 
    #increment the value else set the quantity to 1
    if cart[id] then
      cart[id] = cart[id] + 1
    else
      cart[id] = 1
    end
      redirect_to :action => :index

  end #end add method

  def clearCart
      session[:cart] = nil
      redirect_to :action => :index
  end

  def index
      #if there is a cart, pass it to the page for display else pass an empty value
      if session[:cart] then
          @cart = session[:cart]
      else
          @cart = {}
      end
  end

  # GET /carts
  # GET /carts.json
  # def index
  #   @carts = Cart.all
  # end

  # GET /carts/1
  # GET /carts/1.json
  def show
  end

  def checkout
    @order = Order.new()
    @order.shopper_id = current_shopper.id
    @order.date = Time.now.strftime("%Y/%m/%d")
    @order.save
    redirect_to controller: 'orders'
  end
  
  
  # GET /carts/new
  def new
    @cart = Cart.new
  end

  # GET /carts/1/edit
  def edit
  end

  # POST /carts
  # POST /carts.json
  def create
    @cart = Cart.new(cart_params)

    respond_to do |format|
      if @cart.save
        format.html { redirect_to @cart, notice: 'Cart was successfully created.' }
        format.json { render :show, status: :created, location: @cart }
      else
        format.html { render :new }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /carts/1
  # PATCH/PUT /carts/1.json
  def update
    respond_to do |format|
      if @cart.update(cart_params)
        format.html { redirect_to @cart, notice: 'Cart was successfully updated.' }
        format.json { render :show, status: :ok, location: @cart }
      else
        format.html { render :edit }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /carts/1
  # DELETE /carts/1.json
  def destroy
    @cart.destroy
    respond_to do |format|
      format.html { redirect_to carts_url, notice: 'Cart was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cart
      @cart = Cart.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cart_params
      params.require(:cart).permit(:shopper_id)
    end
end
