json.array!(@valid_accesses) do |valid_access|
  json.extract! valid_access, :wish_list_id, :user_id
  json.url valid_access_url(valid_access, format: :json)
end
