class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # Include default devise modules. Others available are:
  enum role: [:player, :user, :admin]
  has_many :sports
  has_many :playerdetails
  has_many :achievements
  has_many :annocements
  has_many :posts
  after_initialize :set_default_role, :if => :new_record? 
  def set_default_role
    self.role ||= :player   
  end
end