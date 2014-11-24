json.array!(@solutions) do |solution|
  json.extract! solution, :id, :label, :description, :product_id, :platform_id
  json.url solution_url(solution, format: :json)
end
