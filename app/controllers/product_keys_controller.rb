class ProductKeysController < ApplicationController
  before_action :load_product_key, only: %i[show destroy]

  def show; end

  def new
    @product_key = ProductKey.new
    @client_id = params[:client_id]
  end

  def create; end

  def destroy
    @product_key.destroy
    redirect_to root_path
  end


  private

  def load_product_key
    @product_key = ProductKey.find(params[:id])
    @number_days = ProductKeysHelper.working_days(@product_key)
    if @number_days.zero?
      @product_key.status = false
      @product_key.save
    end
  end
end
