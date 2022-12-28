# frozen_string_literal: true

# This is controller for show get client free_keys
class GiveKeysController < ApplicationController
  before_action :authenticate_user!
  
  def give_key
    @product_key = ProductKey.find(params[:key_id].to_i)
    @client = Client.find(params[:client_id].to_i)
  end

  def assign_key
    key_last = comparison_key_and_params(params)

    if key_last.save
      client = Client.find(params[:client_id])
      redirect_to client_path(client)
    else
      give_key_path
    end
  end

  private

  def comparison_key_and_params(params)
    key_last = ProductKey.find(params[:key_id])

    key_last.duration = params[:duration] unless params[:duration].empty?
    key_last.created_at = params[:created_at] unless params[:created_at].empty?
    key_last.comment = params[:comment] unless params[:comment].empty?

    key_last.status = false
    key_last.status = true if params[:status] == 'true'

    key_last.infinite_period = false
    key_last.infinite_period = true if params[:infinite_period] == 'true'

    key_last.client_id = params[:client_id]

    key_last
  end
end
