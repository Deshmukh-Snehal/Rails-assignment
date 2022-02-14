class AddUserIdToAnnocements < ActiveRecord::Migration[5.2]
  def change
    add_column :annocements, :user_id, :integer
    add_index :annocements, :user_id
  end
end
