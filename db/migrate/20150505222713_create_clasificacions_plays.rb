class CreateClasificacionsPlays < ActiveRecord::Migration
  def change
    create_table :clasificacions_plays do |t|
      t.belongs_to :clasificacion
      t.belongs_to :play
    end
  end
end
