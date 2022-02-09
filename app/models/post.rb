class Post < ApplicationRecord
    mount_uploader :image, FileUploader
    has_many :comments
    belongs_to :player
    belongs_to :sport
    has_many :tag_infos
    has_many :players, through: :tag_infos
    validates :title, :image, :description, presence: true
end