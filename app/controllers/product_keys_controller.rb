class ProductKeysController < ApplicationController
  before_action :load_product_key, only: %i[show destroy edit update]

  def show; end

  def new
    @product_key = ProductKey.new
    @client_id = params[:client_id]
  end

  def edit; end

  def create; end

  def update
    if @product_key.update(change_params)
      redirect_to @product_key
    else
      render :edit
    end
  end

  def destroy
    @product_key.destroy
    redirect_to root_path
  end

  private

  def load_product_key
    @product_key = ProductKey.find(params[:id])
    @number_days = CheckKey.working_days(@product_key)
  end

  def change_params
    edit_params = params.require(:product_key).permit(
      :name, :comment, :duration, :client_id,
      :created_at, :infinite_period,
      :infinite_period, :status, :key_type_id
    )

    edit_params['client_id'] = nil if edit_params['client_id'] == ''
    edit_params
  end
end
