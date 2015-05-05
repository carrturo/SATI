class CreateGenerosPlays < ActiveRecord::Migration
  def change
    create_table :generos_plays do |t|
      t.belongs_to :genero
      t.belongs_to :play
    end
  end
end
