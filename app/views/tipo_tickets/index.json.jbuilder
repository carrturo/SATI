json.array!(@tipo_tickets) do |tipo_ticket|
  json.extract! tipo_ticket, :id, :tipo, :precio, :comentario
  json.url tipo_ticket_url(tipo_ticket, format: :json)
end
