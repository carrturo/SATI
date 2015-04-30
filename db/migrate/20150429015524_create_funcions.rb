class CreateFuncions < ActiveRecord::Migration
  def change
    create_table :funcions do |t|
      t.time :hora
      t.string :comentario

      t.timestamps
    end
  end
end
