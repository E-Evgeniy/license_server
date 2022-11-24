class AddColumnKeyTypeToProductKeys < ActiveRecord::Migration[6.1]
  def change
    add_reference :product_keys, :key_types, foreign_key: true
  end
end
