class SportSerializer < ActiveModel::Serializer
  attributes :id, :name, :equipments, :no_of_player
  has_many :posts
  has_many :announcements
end
