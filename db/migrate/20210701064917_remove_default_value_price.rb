class RemoveDefaultValuePrice < ActiveRecord::Migration[6.1]
  def change
    change_column :places, :price, :decimal, default: nil
  end
end
