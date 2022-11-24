class AddColumnPerputualKeyToProductKey < ActiveRecord::Migration[6.1]
  def change
    add_column :product_keys, :key_types, :boolean
  end
end
