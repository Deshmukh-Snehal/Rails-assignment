class CreateTagInfos < ActiveRecord::Migration[5.2]
  def change
    create_table :tag_infos do |t|
      t.string :title
      t.string :player
      t.string :post

      t.timestamps
    end
  end
end
