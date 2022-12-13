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
      :created_at, :infinite_period, :status,
      :key_type, :key_type_id
    )
    puts('[[[[[', params['product_key']['key_type'])
    puts('pppp',params)
    puts('dddd',edit_params)
    edit_params['key_type_id'] = params['product_key']['key_type']['key_type_id']
    edit_params['status'] = true if edit_params['status'] == 'true'
    edit_params['infinite_period'] = true if edit_params['infinite_period'] == 'true'
    edit_params['client_id'] = nil if edit_params['client_id'] == ''
    puts('dddd',edit_params)
    edit_params
  end
end
