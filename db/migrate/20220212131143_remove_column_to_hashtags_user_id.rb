class RemoveColumnToHashtagsUserId < ActiveRecord::Migration[5.2]
  def change
    remove_column :hashtags, :user_id, :integer
  end
end
