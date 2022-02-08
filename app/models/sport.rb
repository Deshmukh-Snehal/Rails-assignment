class Sport < ApplicationRecord
    has_many :players
    has_many :posts
end