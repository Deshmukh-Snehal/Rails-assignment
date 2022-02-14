class AddColumnPlayer < ActiveRecord::Migration[5.2]
  def change
    add_column :playerdetails, :email, :string 
  end
end
