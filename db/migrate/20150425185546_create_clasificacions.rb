class CreateClasificacions < ActiveRecord::Migration
  def change
    create_table :clasificacions do |t|
      t.string :nombre
      t.integer :edadMin
      t.integer :edadMax
      t.string :comentario

      t.timestamps
    end
  end
end
