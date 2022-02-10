class Sport < ApplicationRecord
    has_many :players
    has_many :posts
    validates :sport_name, :sport_equipments, presence: true    
    validates :sport_player, numericality: true
end