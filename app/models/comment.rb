class Comment < ApplicationRecord
  #Associations
  belongs_to :post
  # has_many :hashtags, as: :tagable
end