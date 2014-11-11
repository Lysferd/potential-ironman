json.array!(@manufacturers) do |manufacturer|
  json.extract! manufacturer, :id, :label
  json.url manufacturer_url(manufacturer, format: :json)
end
