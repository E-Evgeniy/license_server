class AddedKeysController < ApplicationController
  before_action :authenticate_user!
  
  def added_keys
    @new_keys = JSON.parse(params[:new_keys])
  end
end
