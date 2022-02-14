class AddColumnPlayerTable < ActiveRecord::Migration[5.2]
  def change
    add_column :players, :name, :string
    add_column :players, :state, :string
    add_column :players, :city, :string
    add_column :players, :country, :string
    add_column :players, :mobileno, :string
  end
end
