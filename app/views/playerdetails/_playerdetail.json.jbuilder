json.extract! playerdetail, :id, :name, :email, :state, :country, :mobile_no, :gender, :created_at, :updated_at
json.url playerdetail_url(playerdetail, format: :json)
