class AddStateToTipoTickets < ActiveRecord::Migration
  def change
    add_column :tipo_tickets, :state, :string
  end
end
