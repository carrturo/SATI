class AddPictureToPlays < ActiveRecord::Migration
  def change
    add_column :plays, :picture, :string
  end
end
