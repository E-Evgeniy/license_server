class ProductKeysController < ApplicationController
  def new(client_id)
    @product_key = ProductKey.new
    @product_key.client_id = client_id
  end

  def create
    @product_key = ProductKey.new
  end
end
