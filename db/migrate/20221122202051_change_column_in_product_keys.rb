class ChangeColumnInProductKeys < ActiveRecord::Migration[6.1]
  def change
    remove_column :product_keys, :status, :string    
    add_column :product_keys, :status, :boolean
  end
end
