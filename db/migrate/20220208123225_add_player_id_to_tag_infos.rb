class AddPlayerIdToTagInfos < ActiveRecord::Migration[5.2]
  def change
    add_column :tag_infos, :player_id, :integer
    add_index :tag_infos, :player_id
  end
end
