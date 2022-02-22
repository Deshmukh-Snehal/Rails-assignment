class RemoveColumnNoOfPlayerSports < ActiveRecord::Migration[5.2]
  def change
    remove_column :sports, :no_of_player, :integer
  end
end
