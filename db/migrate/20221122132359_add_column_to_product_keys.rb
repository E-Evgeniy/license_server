class AddColumnToProductKeys < ActiveRecord::Migration[6.1]
  def change
    add_reference :product_keys, :client, foreign_key: true, null: true
  end
end
