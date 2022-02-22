class AchievementSerializer < ActiveModel::Serializer
  attributes :id, :award, :medal
  belongs_to :user
end