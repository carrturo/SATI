class CreateActorsPlays < ActiveRecord::Migration
  def change
    create_table :actors_plays do |t|
      t.belongs_to :actor
      t.belongs_to :play
    end
  end
end