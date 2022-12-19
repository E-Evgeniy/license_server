# frozen_string_literal: true

# Controller for find keys
class FindKeysController < ApplicationController
  def find_key; end

  def result_key
    @clients = FindClient.search_result(params)
    @clients.each do |client|
      CheckKey.analiz(client.product_keys)
    end
  end
end
