class Post < ApplicationRecord
    mount_uploader :image, FileUploader
    has_many :comments
    belongs_to :player
    belongs_to :sport
    validates :title, :image, :description, presence: true
end