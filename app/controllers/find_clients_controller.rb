class FindClientsController < ApplicationController
  def find_client; end

  def result_client
    @clients = FindClient.search_result(params)
  end
end
