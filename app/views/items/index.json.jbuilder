json.array!(@items) do |item|
  json.extract! item, :name, :image, :url, :wish_list_id
  json.url item_url(item, format: :json)
end
