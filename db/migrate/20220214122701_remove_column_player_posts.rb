class RemoveColumnPlayerPosts < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :player, :integer
  end
end
