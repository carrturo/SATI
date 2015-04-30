class CreateTipoTickets < ActiveRecord::Migration
  def change
    create_table :tipo_tickets do |t|
      t.string :tipo
      t.float :precio
      t.string :comentario

      t.timestamps
    end
  end
end
