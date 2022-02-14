class Playerdetail < ApplicationRecord
  #Association
  belongs_to :sport
  belongs_to :user
  #Validations
  validates :name, :city, :state, :country, :mobile_no, :gender, presence: true
  validates :email, uniqueness: true
  validates :mobile_no, numericality: true
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  validates :mobile_no, length: { is: 10 }
end
