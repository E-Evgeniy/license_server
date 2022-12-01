# frozen_string_literal: true

# Theis is controller for KeyTypes
class KeyTypesController < ApplicationController
  before_action :load_key_type, only: %i[show edit update destroy]

  def index
    @key_types = KeyType.all
  end

  def show; end

  def edit; end

  def new
    @key_type = KeyType.new
  end

  def create
    @key_type = KeyType.new(key_type_params)

    if @key_type.save
      redirect_to key_types_path
    else
      render :new
    end
  end

  def update
    if @key_type.update(key_type_params)
      redirect_to key_types_path
    else
      render :edit
    end
  end

  def destroy
    @key_type.destroy
    redirect_to key_types_path
  end

  private

  def key_type_params
    params.require(:key_type).permit(:name, :comment)
  end

  def load_key_type
    @key_type = KeyType.find(params[:id])
  end
end
