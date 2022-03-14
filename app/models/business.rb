class Business < ApplicationRecord
  def self.to_csv(fields = column_names, options = {})
    CSV.generate(options) do |csv|
      csv << fields
      all.each do |business|
        csv << business.attributes.values_at(*fields)
      end
    end
  end

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      business_hash = row.to_hash
      business = find_or_create_by!(
                                    name: business_hash['name'],
                                    address: business_hash['address'],
                                    start_date: business_hash['start_date'],
                                    end_date: business_hash['end_date']
                                  )
      business.update_attributes(business_hash)
    end
  end

  #Validations
  validates :name, :address, :start_date, :end_date, presence: true

  #Associations
  has_many :offers
end