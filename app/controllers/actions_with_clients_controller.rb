class ActionsWithClientsController < ApplicationController

  def added_keys
    new_keys = []
    number_keys = params[:volume_keys]
    puts('sss',params)
    puts('rrr',params[:number_keys])
  end
end