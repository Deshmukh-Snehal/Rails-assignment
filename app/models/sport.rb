class Sport < ApplicationRecord
    belongs_to :user
    has_many :posts
    has_many :announcements
end
