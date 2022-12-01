class ClientsController < ApplicationController
  # validates_format_of :email, :with => /.+@.+\..+/i   #/@/
  before_action :load_client, only: %i[show destroy]

  def new
    @client = Client.new
  end

  def create
    @client = Client.new(client_params)

    if @client.save
      redirect_to @client
    else
      render :new
    end
  end

  def show
    
  end

  def find
  end

  def result
  end

  def destroy
    @client.destroy
    redirect_to clients_path
  end

  private

  def client_params
    params.require(:client).permit(:name, :comment, :email)
  end

  def load_client
    @client = Client.find(params[:id])
  end
end
