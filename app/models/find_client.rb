class FindClient < ApplicationRecord
  include StringRequest

  def self.search_result(params)
    string_request = StringRequest.forming_query_string(params, 'Client')
    Client.where(string_request)
  end
end