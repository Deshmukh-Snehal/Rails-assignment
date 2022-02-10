class Achievement < ApplicationRecord
    belongs_to :player
    validates :awards, :medals, presence: true
end