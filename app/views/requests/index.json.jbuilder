json.array!(@requests) do |request|
  json.extract! request, :wish_list_id, :user_id, :user_from_id, :status
  json.url request_url(request, format: :json)
end
