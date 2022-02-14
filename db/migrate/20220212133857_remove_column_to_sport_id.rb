class RemoveColumnToSportId < ActiveRecord::Migration[5.2]
  def change
    remove_column :players, :sport_id, :integer
  end
end
