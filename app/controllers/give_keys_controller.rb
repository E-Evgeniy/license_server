# frozen_string_literal: true

# This is controller for show get client free_keys
class GiveKeysController < ApplicationController
  def give_key
    @product_key = ProductKey.find(params[:key_id].to_i)
    @client = Client.find(params[:client_id].to_i)
  end

  def assign_key

  end
end
