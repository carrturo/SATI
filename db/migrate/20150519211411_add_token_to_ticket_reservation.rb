class AddTokenToTicketReservation < ActiveRecord::Migration
  def change
    add_column :ticket_reservations, :token, :string
  end
end
