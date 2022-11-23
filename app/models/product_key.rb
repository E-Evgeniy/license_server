class ProductKey < ApplicationRecord
  belongs_to :client, optional: true
end
