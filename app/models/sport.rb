class Sport < ApplicationRecord
  #Associations
  belongs_to :user 
  has_many :playerdetails, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :annocements, dependent: :destroy
  # before_validation :set_name
  # after_validation :set_name
  # before_save :change_name
  #Backend Validations
  validates :sport_name, :sport_equipments, presence: true 
  
  # private

  # def set_name
  #   self.sport_name = "Please check sport Name"
  # end

  # def change_name
  #   self.sport_name = "Please check sport"
  # end
  # def as_json
  #   response = super
  #   response.merge!(sport_name: self.sport.sport_name)
  #   response
  # end
end