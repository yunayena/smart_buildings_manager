json.array!(@sensors) do |sensor|
  json.extract! sensor, :id, :name, :description, :kind
  json.url sensor_url(sensor, format: :json)
end
