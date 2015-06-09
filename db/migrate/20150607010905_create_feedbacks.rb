class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
      t.integer :age
      t.string :title
      t.text :message

      t.timestamps
    end
  end
end
