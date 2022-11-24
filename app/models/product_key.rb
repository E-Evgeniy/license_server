class ProductKey < ApplicationRecord
  belongs_to :client, optional: true
  belongs_to :key_type
end
