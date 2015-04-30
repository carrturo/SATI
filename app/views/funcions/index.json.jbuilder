json.array!(@funcions) do |funcion|
  json.extract! funcion, :id, :hora, :comentario
  json.url funcion_url(funcion, format: :json)
end
