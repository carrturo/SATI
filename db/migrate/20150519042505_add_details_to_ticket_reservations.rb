class AddDetailsToTicketReservations < ActiveRecord::Migration
  def change
    add_column :ticket_reservations, :total_price, :float
    add_column :ticket_reservations, :total_tickets, :integer
  end
end
