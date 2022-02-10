class CreateSports < ActiveRecord::Migration[5.2]
  def change
    create_table :sports do |t|
      t.string :sport_name
      t.string :sport_equipments
      t.bigint :sport_player

      t.timestamps
    end
  end
end
