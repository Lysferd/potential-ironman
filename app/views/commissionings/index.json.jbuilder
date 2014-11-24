json.array!(@commissionings) do |commissioning|
  json.extract! commissioning, :id, :label, :description, :client_id, :solutions_id
  json.url commissioning_url(commissioning, format: :json)
end
