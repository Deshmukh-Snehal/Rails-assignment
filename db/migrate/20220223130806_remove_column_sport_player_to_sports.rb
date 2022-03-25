class RemoveColumnSportPlayerToSports < ActiveRecord::Migration[5.2]
  def change
    remove_column :sports, :sport_player, :bigint
  end
end
