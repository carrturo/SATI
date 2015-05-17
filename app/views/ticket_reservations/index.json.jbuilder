json.array!(@ticket_reservations) do |ticket_reservation|
  json.extract! ticket_reservation, :id, :name, :identity, :email
  json.url ticket_reservation_url(ticket_reservation, format: :json)
end
