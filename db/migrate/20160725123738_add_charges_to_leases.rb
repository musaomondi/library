class AddChargesToLeases < ActiveRecord::Migration[5.0]
  def change
    add_column :leases, :charge, :float
  end
end
