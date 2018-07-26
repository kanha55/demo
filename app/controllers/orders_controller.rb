class OrdersController < ApplicationController
  
  def index
    @orders = current_user.orders
  end

  def new
    @order = Order.new
    #@order.product_id = params[:product_id]
    #@order.total = Product.find(@order.product_id).price
    #@order.save
  end

  def create
   # @order = Order.new(order_params)
    #@order.user_id = current_user.id
    #@order.total = Product.find(@order.product_id).price
    @product = Product.find(params[:product_id])
      

    @product = @product.orders.create(order_params)
    @product = Product.find(params[:product_id])

    @order = Order.find(@product.orders.last.id)
    @order.user_id = current_user.id
    
    if @order.save
      if current_user.carts.count != 0
        @cart = Cart.find_by(product_id:params[:product_id])
        @cart.destroy!
      end
    end  
    #@order.product_id = params[:product_id]

    if @product.save!
      redirect_to product_order_path(params[:product_id],Product.find(params[:product_id]).orders)
    else
      render 'new'
    end  
        
  end

  def show
     UserMailer.send_email(current_user).deliver
    @product = Product.find(params[:product_id])
  end

  def destroy
    @order = Order.find(params[:id])

    if @order.destroy
      redirect_to orders_path()
    else
      render plain: "Error in Destroy orders"
    end    
  end

  private

    def order_params
      params.require(:order).permit(:fname, :lname, :address)  
    end

end
