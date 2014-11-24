json.array!(@products) do |product|
  json.extract! product, :id, :label, :description, :manufacturer_id
  json.url product_url(product, format: :json)
end
