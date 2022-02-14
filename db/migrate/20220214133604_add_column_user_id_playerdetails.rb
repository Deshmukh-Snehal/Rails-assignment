class AddColumnUserIdPlayerdetails < ActiveRecord::Migration[5.2]
  def change
    add_column :playerdetails, :user_id, :integer
    add_index :playerdetails, :user_id
  end
end
