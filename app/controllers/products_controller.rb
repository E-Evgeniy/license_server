class ProductsController < ApplicationController
  before_action :load_product, only: %i[ show edit update]

  def index
    @products = Product.all
  end

  def show
  end

  def new
    @product = Product.new
  end

  def create
    @product=Product.new(product_params)
    
    if @product.save
      redirect_to @product
    else
      render :new
    end
  end

  def update
    if @product.update(product_params)
      redirect_to @product
    else
      render :edit
    end
  end

  private

  def load_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :comment)
  end
end
