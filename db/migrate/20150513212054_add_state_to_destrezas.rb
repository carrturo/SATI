class AddStateToDestrezas < ActiveRecord::Migration
  def change
    add_column :destrezas, :state, :string
  end
end
