json.array!(@commissionings) do |commissioning|
  json.extract! commissioning, :id, :label, :description
  json.url commissioning_url(commissioning, format: :json)
end
