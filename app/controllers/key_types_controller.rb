class KeyTypesController < ApplicationController
  before_action :load_key_type, only: %i[show edit update destroy]

  def index
    @key_types = KeyType.all
  end

  def new
    @key_type = KeyType.new
  end

  def create
    @key_type = KeyType.new

    if @key_type.save
      redirect_to @key_type
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
    params.require(:key_type).permit(:name, :comment)
  end

  def load_client
    @key_type = KeyType.find(params[:id])
  end
end
