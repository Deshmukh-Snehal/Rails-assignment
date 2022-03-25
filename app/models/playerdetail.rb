class Playerdetail < ApplicationRecord
  #Association
  belongs_to :sport
  belongs_to :user
  acts_as_taggable_on :tags
  #Validations
  validates :name, :state, :country, :mobile_no, :gender, presence: true
  validates :name, uniqueness: true
  validates :email, uniqueness: true
  validates :mobile_no, numericality: true
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  validates :mobile_no, length: { is: 10 }
end