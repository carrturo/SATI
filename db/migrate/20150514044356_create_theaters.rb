class CreateTheaters < ActiveRecord::Migration
  def change
    create_table :theaters do |t|
      t.string :name
      t.text :address
      t.integer :capacity

      t.timestamps
    end
  end
end
