class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.integer :cost
      t.string :state
      t.references :organization, foreign_key: true

      t.timestamps
    end
  end
end
