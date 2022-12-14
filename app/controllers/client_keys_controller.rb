# frozen_string_literal: true

# This is controller for show client_keys
class ClientKeysController < ApplicationController
  def client_keys
    require 'json'
    @client_keys = JSON.parse(params[:format])
  end
end
