class CreatePlays < ActiveRecord::Migration
  def change
    create_table :plays do |t|
      t.string :title
      t.text :summary
      t.string :promotional_video
      t.integer :duration
      t.date :end_date

      t.timestamps
    end
  end
end
