class CreatePlays < ActiveRecord::Migration
  def change
    create_table :plays do |t|
      t.string :title
      t.text :summary
      t.string :promotional_video
      t.integer :duration
      t.date :end_date
      t.string :state
      
      t.timestamps
      t.belongs_to :clasificacion
    end
  end
end
