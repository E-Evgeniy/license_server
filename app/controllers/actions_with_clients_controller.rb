class ActionsWithClientsController < ApplicationController

  before_action :authenticate_user!

  def create_keys
    new_keys = []
    number_keys = params[:number_keys].to_i.abs
    number_days = params[:number_days].to_i.abs

    return unless number_keys.positive? && (number_days.positive? || params[:infinite_key])

    new_keys << create_keys1(params, new_keys, number_keys, number_days)
    new_keys.delete(new_keys.last)

    new_keys_json = new_keys.to_json

    redirect_to controller: 'added_keys', action: 'added_keys', new_keys: new_keys_json
  end

  private

  def check_infinite_period(params)
    params[:key_type]['key_type_id'] == 'local' || params['infinite_period'] == 'true'
  end

  def create_keys1(params, new_keys, number_keys, number_days)
    infinite_period = false
    infinite_period = true if check_infinite_period(params) 

    number_keys.times do
      pk = ProductKey.new(name: ActionsWithClientsHelper.give_name_key,
                                    duration: number_days,
                                    product_id: 1,
                                    client_id: params[:client_id].to_i,
                                    status: true,
                                    comment: params[:comment],
                                    key_type_id: params[:key_type]['key_type_id'],
                                    infinite_period: infinite_period)
      pk.save
      new_keys << pk
    end
  end
end
