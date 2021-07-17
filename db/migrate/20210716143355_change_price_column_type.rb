class ChangePriceColumnType < ActiveRecord::Migration[6.1]
  def change
    change_column :places, :price, :decimal, precision: 8, scale: 2
  end
end
