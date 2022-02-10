class AddColumnSport < ActiveRecord::Migration[5.2]
  def change
    add_column :players, :sport, :string
  end
end