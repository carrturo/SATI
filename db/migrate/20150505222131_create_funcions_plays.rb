class CreateFuncionsPlays < ActiveRecord::Migration
  def change
    create_table :funcions_plays do |t|
      t.belongs_to :funcion
      t.belongs_to :play
    end
  end
end
