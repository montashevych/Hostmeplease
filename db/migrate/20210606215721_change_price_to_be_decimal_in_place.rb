class ChangePriceToBeDecimalInPlace < ActiveRecord::Migration[6.1]
  def change
    change_column :places, :price, :decimal
  end
end
