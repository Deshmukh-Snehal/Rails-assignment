class AddPostIdToTagInfos < ActiveRecord::Migration[5.2]
  def change
    add_column :tag_infos, :post_id, :integer
    add_index :tag_infos, :post_id
  end
end
