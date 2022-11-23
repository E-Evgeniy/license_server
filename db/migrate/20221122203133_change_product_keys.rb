class ChangeProductKeys < ActiveRecord::Migration[6.1]
  def change
    change_table :product_keys do |t|
      t.rename :type, :key_type
    end
  end
end
