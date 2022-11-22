class ClientsController < ApplicationController
  #validates_format_of :email, :with => /.+@.+\..+/i   #/@/

  def new
    @client = Client.new
  end

  def create
    @client = Client.new(client_params)

    if @client.save
      #redirect_to @product
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

  private

  def client_params
    params.require(:client).permit(:name, :comment, :email)
  end
end
