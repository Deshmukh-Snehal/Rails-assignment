class CreateOffers < ActiveRecord::Migration[5.2]
  def change
    create_table :offers do |t|
      t.string :title
      t.text :description
      t.string :tags
      t.references :business, foreign_key: true

      t.timestamps
    end
  end
end
