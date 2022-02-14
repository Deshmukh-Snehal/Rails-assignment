class AddSportIdToAnnocements < ActiveRecord::Migration[5.2]
  def change
    add_column :annocements, :sport_id, :integer
    add_index :annocements, :sport_id
  end
end
