class AddColumnSportIdPlayerdetails < ActiveRecord::Migration[5.2]
  def change
    add_column :playerdetails, :sport_id, :integer 
  end
end
