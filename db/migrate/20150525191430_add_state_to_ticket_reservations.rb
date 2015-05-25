class AddStateToTicketReservations < ActiveRecord::Migration
  def change
    add_column :ticket_reservations, :state, :string
  end
end
