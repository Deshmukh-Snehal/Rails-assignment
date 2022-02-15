class Sport < ApplicationRecord
  #Associations
  belongs_to :user 
  has_many :playerdetails, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :annocements, dependent: :destroy
  #Backend Validations
  validates :sport_name, :sport_equipments, presence: true 
end