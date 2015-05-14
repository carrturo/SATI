class AddStateToClasificacions < ActiveRecord::Migration
  def change
    add_column :clasificacions, :state, :string
  end
end
