class AddStateToTheaters < ActiveRecord::Migration
  def change
    add_column :theaters, :state, :string
  end
end
