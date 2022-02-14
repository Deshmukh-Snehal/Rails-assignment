class RemoveColumnToAchievements < ActiveRecord::Migration[5.2]
  def change
    remove_column :achievements, :player_id, :integer
  end
end
