class ProductKeysController < ApplicationController
  def new
    @product_key = ProductKey.new
    @client_id = params[:client_id]
  end

  def show
  end
end
