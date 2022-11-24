class CreateKeyTypes < ActiveRecord::Migration[6.1]
  def change
    create_table :key_types do |t|
      t.string :name
      t.string :comment

      t.timestamps
    end
  end
end
