json.array!(@info_generals) do |info_general|
  json.extract! info_general, :id, :nombre, :direccion, :telefono, :email, :fb, :tw, :youtube, :ig
  json.url info_general_url(info_general, format: :json)
end
