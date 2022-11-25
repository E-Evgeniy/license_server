class AddColumnKeyTypeToProductKeys < ActiveRecord::Migration[6.1]
  def change
    add_reference :product_keys, :key_type, foreign_key: true
  end
end
