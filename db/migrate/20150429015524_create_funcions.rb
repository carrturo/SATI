class CreateFuncions < ActiveRecord::Migration
  def change
    create_table :funcions do |t|
      t.datetime :hora
      t.string :comentario

      t.timestamps
    end
  end
end
