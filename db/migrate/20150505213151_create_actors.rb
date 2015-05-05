class CreateActors < ActiveRecord::Migration
  def change
    create_table :actors do |t|
      t.string :name
      t.string :gender
      t.string :identity
      t.string :email
      t.string :facebook_profile
      t.text :biography

      t.timestamps
    end
  end
end
