class AddStateToGeneros < ActiveRecord::Migration
  def change
    add_column :generos, :state, :string
  end
end
