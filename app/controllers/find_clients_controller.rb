class FindClientsController < ApplicationController
  before_action :authenticate_user!
  
  def find_client; end

  def result_client
    @clients = FindClient.search_result(params)
    @clients.each do |client|
      CheckKey.analiz(client.product_keys)
    end
  end
end
