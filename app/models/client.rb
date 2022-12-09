# frozen_string_literal: true

class Client < ApplicationRecord
  has_many :product_keys, dependent: :destroy
end
