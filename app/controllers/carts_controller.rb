class CartsController < ApplicationController
  
  def index
    @carts = current_user.carts
  end

  def new
    @cart = Cart.new
    @product = Product.find(params[:product_id])
    @cart.product_id = @product.id
    @cart.user_id = current_user.id
    @cart.save
    redirect_to products_path
  end

  def destroy
    @cart = Cart.find(params[:id])
    if @cart.destroy
     redirect_to carts_path
    else
      render "error in destroy" 
    end
  end
end
