class CreateOffers < ActiveRecord::Migration[5.2]
  def change
    create_table :offers do |t|
      t.string :title
      t.text :description
      t.references :businesses, foreign_key: true

      t.timestamps
    end
  end
end
