class Hashtag < ApplicationRecord
  #Associations
  belongs_to :tagable, polymorphic: true
end