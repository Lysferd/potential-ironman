json.array!(@certifications) do |certification|
  json.extract! certification, :id
  json.url certification_url(certification, format: :json)
end
