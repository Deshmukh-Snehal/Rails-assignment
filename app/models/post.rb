class Post < ApplicationRecord
  #imageuploading
  mount_uploader :image, FileUploader
  #Association
  belongs_to :user
  has_many :comments
  belongs_to :sport
  has_many :hashtags, as: :tagable
  #Backend Validations
  validates :title, :image, :description, presence: true
end