# frozen_string_literal: true

class FindKey < ApplicationRecord
    include StringRequest
  
    def self.search_result(params)
      string_request = StringRequest.forming_query_string(params, 'ProductKey')
      puts('string_request =',string_request)
      t = ProductKey.where(string_request)
    end
  end