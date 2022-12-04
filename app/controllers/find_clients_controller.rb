class FindClientsController < ApplicationController
  def find_client; end

  def result_client
    puts('ssssdddffgg',FindClient.search_result(params))
  end

end
