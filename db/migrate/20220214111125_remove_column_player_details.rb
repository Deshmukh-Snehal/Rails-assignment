class RemoveColumnPlayerDetails < ActiveRecord::Migration[5.2]
  def change
    remove_column :players, :player_name, :string
    remove_column :players, :player_state, :string
    remove_column :players, :player_city, :string
    remove_column :players, :player_country, :string
    remove_column :players, :player_mobileno, :string
  end
end