class FindClient < ApplicationRecord
  include StringRequest

  def self.search_result(params)
    StringRequest.forming_query_string(params, 'Client')
  end
end