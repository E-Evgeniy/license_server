# frozen_string_literal: true

# Controller for product
class ProductsController < ApplicationController
  before_action :authenticate_user!
  before_action :load_product, only: %i[show update destroy edit]

  def index
    @products = Product.all
  end

  def show; end

  def new
    @product = Product.new
  end

  def edit; end

  def create
    @product = Product.new(product_params)

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

  def destroy
    @product.destroy
    redirect_to products_path
  end

  private

  def load_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :comment)
  end
end
