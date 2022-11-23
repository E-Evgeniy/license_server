class AddColumnToProductKeys < ActiveRecord::Migration[6.1]
  def change
    add_reference :product_keys, :client, null: true, foreign_key: true
  end
end
