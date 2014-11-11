json.array!(@platforms) do |platform|
  json.extract! platform, :id, :label
  json.url platform_url(platform, format: :json)
end
