class Player < ApplicationRecord
    belongs_to :sport
    has_many :achievements
    has_many :posts
end