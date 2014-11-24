json.array!(@activities) do |activity|
  json.extract! activity, :id, :label, :description, :date_start, :date_end, :user_id
  json.url activity_url(activity, format: :json)
end
