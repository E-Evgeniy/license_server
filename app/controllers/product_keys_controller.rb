class ProductKeysController < ApplicationController
  def new
    @product_key = ProductKey.new
  end

  def create
    @product_key = ProductKey.new
  end
end
