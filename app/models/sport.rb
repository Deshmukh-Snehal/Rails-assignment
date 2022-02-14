class Sport < ApplicationRecord
  #Associations
  belongs_to :user 
  has_many :playerdetails
  has_many :posts
  has_many :annocements
  #Backend Validations
  validates :sport_name, :sport_equipments, presence: true 
end