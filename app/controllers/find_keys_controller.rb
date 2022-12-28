# frozen_string_literal: true

# Controller for find keys
class FindKeysController < ApplicationController
  before_action :authenticate_user!
  def find_key; end

  def result_key
    @keys = FindKey.search_result(params)
  end
end
