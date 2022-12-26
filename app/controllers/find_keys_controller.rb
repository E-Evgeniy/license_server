# frozen_string_literal: true

# Controller for find keys
class FindKeysController < ApplicationController
  def find_key; end

  def result_key
    puts('wwwwwwwww',params)
    @keys = FindKey.search_result(params)
  end
end
