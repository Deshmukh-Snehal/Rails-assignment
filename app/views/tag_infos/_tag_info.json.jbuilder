json.extract! tag_info, :id, :title, :player, :post, :created_at, :updated_at
json.url tag_info_url(tag_info, format: :json)
