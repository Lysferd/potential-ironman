json.array!(@clients) do |client|
  json.extract! client, :id, :label
  json.url client_url(client, format: :json)
end
