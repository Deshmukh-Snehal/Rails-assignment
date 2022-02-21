class RemoveColumnUserIdToSports < ActiveRecord::Migration[5.2]
  def change
    remove_column :sports, :user_id, :integer
  end
end
