class Achievement < ApplicationRecord
  #Achievement schema
  # t.string "award"
  # t.string "medal"
  # t.integer "user_id"

  #Association
  belongs_to :user

  #Validations
  validates :award, :medal, presence: true
end