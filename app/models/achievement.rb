class Achievement < ApplicationRecord
  #Association
  belongs_to :user
  #Backend Validations
  validates :awards, :medals, presence: true
end