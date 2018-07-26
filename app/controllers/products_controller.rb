class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if  @product.save
      redirect_to products_path
    else
      render 'new'  
    end
  end

  def show

    @categeory_id = Categeory.find(params[:id])
    @products = Product.where(categeory_id: @categeory_id.id)
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])

    if @product.update(product_params)
      redirect_to products_path
    else
      render 'edit'
    end    
  end

  def destroy
    @product = Product.find(params[:id])

    if @product.destroy
      redirect_to products_path
    else
      render plain: "Error in destroy product"    
    end
  end

  private

    def product_params
      params.require(:product).permit(:title, :description, :price,:categeory_id, :product_image)  
    end

end
