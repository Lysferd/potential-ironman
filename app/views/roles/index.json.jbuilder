json.array!(@roles) do |role|
  json.extract! role, :id, :label
  json.url role_url(role, format: :json)
end
