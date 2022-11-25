class ActionsWithClientsController < ApplicationController

  def added_keys
    new_keys = []
    number_keys = params[:number_keys].to_i.abs
    number_days = params[:number_days].to_i.abs

    return unless number_keys.positive? && (number_days.positive? || params[:infinite_key])

    @new_keys = create_keys(params, new_keys, number_keys, number_days)
  end

  def create_keys(params, new_keys, number_keys, number_days)
    number_keys.times do
      pk = ProductKey.new(name: ActionsWithClientsHelper.give_name_key,
                                    duration: number_days,
                                    product_id: 1,
                                    client_id: params[:client_id].to_i,
                                    status: true,
                                    comment: params[:comment],
                                    key_type_id: params[:key_type]['key_type_id'],
                                    infinite_period: params[:infinite_key])
      pk.save
      new_keys << pk
    end
  end
end
