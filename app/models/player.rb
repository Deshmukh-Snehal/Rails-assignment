class Player < ApplicationRecord
    belongs_to :sport
    has_many :achievements
end