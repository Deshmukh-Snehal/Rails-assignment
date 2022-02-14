class CreateAnnocements < ActiveRecord::Migration[5.2]
  def change
    create_table :annocements do |t|
      t.text :title

      t.timestamps
    end
  end
end
