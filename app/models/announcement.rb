class Announcement < ApplicationRecord
  #Announcement schema
  # t.string "title"
  # t.text "description"
  # t.integer "sport_id"

  #Association
  belongs_to :sport

  #Validations
  validates :title, :description, presence: true
end
