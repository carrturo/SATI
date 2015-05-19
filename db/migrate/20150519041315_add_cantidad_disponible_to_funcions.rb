class AddCantidadDisponibleToFuncions < ActiveRecord::Migration
  def change
    add_column :funcions, :cant_disponible, :integer
  end
end
