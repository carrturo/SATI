class CreateTicketReservations < ActiveRecord::Migration
  def change
    create_table :ticket_reservations do |t|
      t.string :name
      t.string :identity
      t.string :email

      t.timestamps
    end
  end
end
