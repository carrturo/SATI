class CreateDestrezas < ActiveRecord::Migration
  def change
    create_table :destrezas do |t|
      t.string :nombre
      t.string :comentario

      t.timestamps
    end
  end
end
