json.array!(@boards) do |board|
  json.extract! board, :id, :name, :description, :model
  json.url board_url(board, format: :json)
end
