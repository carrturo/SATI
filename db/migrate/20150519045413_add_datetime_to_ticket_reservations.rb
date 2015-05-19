class AddDatetimeToTicketReservations < ActiveRecord::Migration
  def change
    add_column :ticket_reservations, :date, :datetime
  end
end
