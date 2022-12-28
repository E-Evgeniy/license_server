class ClientsController < ApplicationController
  # validates_format_of :email, :with => /.+@.+\..+/i   #/@/
  before_action :authenticate_user!
  before_action :load_client, only: %i[show destroy edit update]

  def show
    @client_active_keys_id = find_active_keys_id
    @client_keys_id = find_keys_id
  end

  def new
    @client = Client.new
  end

  def edit; end

  def create
    @client = Client.new(client_params)

    if @client.save
      flash.now[:alert] = 'msg'
      redirect_to @client
    else
      render :new
    end
  end

  def update
    if @client.update(client_params)
      redirect_to @client
    else
      render :edit
    end
  end

  def find; end

  def result; end

  def destroy
    @client.destroy
    redirect_to root_path
  end

  private

  def find_active_keys_id
    return [] unless @client.product_keys.where(status: true).count.positive?

    forming_array(@client.product_keys.where(status: true))
  end

  def find_keys_id
    return [] unless @client.product_keys.count.positive?

    forming_array(@client.product_keys)
  end

  def forming_array(obj)
    array_client_keys = []
    obj.each do |c_key|
      array_client_keys << c_key.id
    end
    array_client_keys
  end

  def client_params
    params.require(:client).permit(:name, :comment, :email)
  end

  def load_client
    @client = Client.find(params[:id])
  end
end
