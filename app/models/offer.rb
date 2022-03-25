# == Schema Information
#
# Table name: offers
#
#  id          :bigint           not null, primary key
#  title       :string
#  description :text
#  tags        :string
#  business_id :bigint
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Offer < ApplicationRecord
  before_validation :normalize_title, on: :create
  before_save :msg_print
  audited
  #Associations
  belongs_to :business

  def as_json
    response = super
    response.merge!({business_name: self.business.name})
    response.merge!({startdate: self.start_date.strftime("%Y-%m-%d at %I:%M %p")})
    response.merge!({enddate: self.end_date.strftime("%Y-%m-%d at %I:%M %p")})
    response
  end

  #Scope
  scope :is_active, -> {where(:start_date=> Time.now.beginning_of_month..Time.now.end_of_month)}
  
  private
    def normalize_title
      self.title = title.downcase.titleize
    end

    def msg_print
      puts "Hello everyone!"
    end
end
