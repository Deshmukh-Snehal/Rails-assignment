class TagInfo < ApplicationRecord
    belongs_to :player
    belongs_to :post
    validates :comment, presence: true
end