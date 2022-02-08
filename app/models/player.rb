class Player < ApplicationRecord
    mount_uploader :image, FileUploader
    belongs_to :sport
    has_many :achievements
    has_many :posts
end