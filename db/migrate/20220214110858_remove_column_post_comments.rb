class RemoveColumnPostComments < ActiveRecord::Migration[5.2]
  def change
    remove_column :comments, :post, :string
  end
end
