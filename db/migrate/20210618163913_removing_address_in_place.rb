class RemovingAddressInPlace < ActiveRecord::Migration[6.1]
  def change
    remove_column :places, :address
  end
end
