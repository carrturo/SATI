json.array!(@destrezas) do |destreza|
  json.extract! destreza, :id, :nombre, :comentario
  json.url destreza_url(destreza, format: :json)
end
