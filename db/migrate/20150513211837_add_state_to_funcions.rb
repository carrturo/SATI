class AddStateToFuncions < ActiveRecord::Migration
  def change
    add_column :funcions, :state, :string
  end
end
