json.array!(@theaters) do |theater|
  json.extract! theater, :id, :name, :address, :capacity
  json.url theater_url(theater, format: :json)
end
