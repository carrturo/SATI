json.array!(@generos) do |genero|
  json.extract! genero, :id, :nombre, :comentario
  json.url genero_url(genero, format: :json)
end
