class RemoveColumnToProductKeys < ActiveRecord::Migration[6.1]
  def change
    remove_column :product_keys, :key_type
  end
end
