class Annocement < ApplicationRecord
  # Association
  belongs_to :user
  belongs_to :sport
end
