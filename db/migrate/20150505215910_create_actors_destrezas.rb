class CreateActorsDestrezas < ActiveRecord::Migration
  def change
    create_table :actors_destrezas do |t|
      t.belongs_to :actor
      t.belongs_to :destreza
    end
  end
end
