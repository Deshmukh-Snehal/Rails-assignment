class CreatePlayerdetails < ActiveRecord::Migration[5.2]
  def change
    create_table :playerdetails do |t|
      t.string :name
      t.string :email
      t.string :state
      t.string :country
      t.string :mobile_no
      t.string :gender

      t.timestamps
    end
  end
end
