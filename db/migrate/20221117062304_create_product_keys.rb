class CreateProductKeys < ActiveRecord::Migration[6.1]
  def change
    create_table :product_keys do |t|
      t.string :name
      t.integer :duration
      t.string :ip
      t.string :status
      t.string :comment
      t.string :type
      t.references :product, foreign_key: true

      t.timestamps
    end
  end
end
