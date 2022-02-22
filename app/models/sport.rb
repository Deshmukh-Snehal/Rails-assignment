class Sport < ApplicationRecord
    has_many :users
    has_many :posts
    has_many :announcements
end
