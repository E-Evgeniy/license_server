class AddedKeysController < ApplicationController
  def added_keys
    @new_keys = JSON.parse(params[:new_keys])
  end
end
