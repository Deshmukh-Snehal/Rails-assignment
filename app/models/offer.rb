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
  #Associations
  belongs_to :business

  def as_json
    response = super
    response.merge!({business_name: self.business.name})
    response.merge!({startdate: self.start_date.strftime("%Y-%m-%d at %I:%M %p")})
    response.merge!({enddate: self.end_date.strftime("%Y-%m-%d at %I:%M %p")})
    response
  end
end
