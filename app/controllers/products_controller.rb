class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
    @object = Product.new()
  end

  def create
    if Product.create(product_params)
      redirect_to products_path
    else
      return "error"
    end
  end

  def description
    @product = Product.find(params[:id])
    render plain: @product.description
  end

  def inventory
    @product = Product.find(params[:id])
    render plain: (@product.inventory == 0 ? false : true)
  end

  private

  def product_params
    params.require(:product).permit(:name,:description)
  end
end
