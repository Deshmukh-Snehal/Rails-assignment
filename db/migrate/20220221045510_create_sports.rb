class CreateSports < ActiveRecord::Migration[5.2]
  def change
    create_table :sports do |t|
      t.string :name
      t.string :equipments
      t.string :no_of_player

      t.timestamps
    end
  end
end
