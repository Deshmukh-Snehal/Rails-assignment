class CreateOrganizations < ActiveRecord::Migration[5.2]
  def change
    create_table :organizations do |t|
      t.string :name
      t.string :city
      t.string :state
      t.string :country
      t.text :services

      t.timestamps
    end
  end
end
