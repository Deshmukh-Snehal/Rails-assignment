class Player < ApplicationRecord
    mount_uploader :image, FileUploader
    belongs_to :sport
    has_many :achievements
    has_many :posts
    has_many :tag_infos
    has_many :posts, through: :tag_info
    validates :image, :player_name, :player_city, :player_state, :player_mobileno, :player_country, :gender, presence: true
    validates :player_mobileno, numericality: true
    validates :player_mobileno, length: { is: 10 }
    validates :email, uniqueness: true
    validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
end