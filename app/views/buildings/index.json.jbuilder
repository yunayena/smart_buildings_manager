json.array!(@buildings) do |building|
  json.extract! building, :id, :name, :description, :address, :postal_code, :phone
  json.url building_url(building, format: :json)
end
