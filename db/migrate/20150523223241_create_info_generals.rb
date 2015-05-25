class CreateInfoGenerals < ActiveRecord::Migration
  def change
    create_table :info_generals do |t|
      t.string :nombre
      t.string :direccion
      t.string :telefono
      t.string :email
      t.string :fb
      t.string :tw
      t.string :youtube
      t.string :ig

      t.timestamps
    end
  end
end
