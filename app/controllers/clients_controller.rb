class ClientsController < ApplicationController
  # validates_format_of :email, :with => /.+@.+\..+/i   #/@/
  before_action :load_client, only: %i[show destroy edit update]

  def show; end

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

  def client_params
    params.require(:client).permit(:name, :comment, :email)
  end

  def load_client
    @client = Client.find(params[:id])
  end
end
