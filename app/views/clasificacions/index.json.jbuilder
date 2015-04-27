json.array!(@clasificacions) do |clasificacion|
  json.extract! clasificacion, :id, :nombre, :edadMin, :edadMax, :comentario
  json.url clasificacion_url(clasificacion, format: :json)
end
