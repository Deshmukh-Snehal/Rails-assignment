class CreateAchievements < ActiveRecord::Migration[5.2]
  def change
    create_table :achievements do |t|
      t.string :awards
      t.string :medals

      t.timestamps
    end
  end
end
