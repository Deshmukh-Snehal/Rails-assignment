class Sport < ApplicationRecord
  #Associaions
  has_many :users
  has_many :posts
  has_many :announcements

  #Validations
  validates :name, :equipments, presence: true
end
