class Post < ApplicationRecord
  # Post Schema
  # t.string "title"
  # t.text "description"
  # t.string "tag"
  # t.integer "sport_id"

  #Association
  belongs_to :sport

  #Validations
  validates :title, :description, :tag, presence: true
end
