class AddCountryToPlace < ActiveRecord::Migration[6.1]
  def change
    add_reference :places, :country, null: false, foreign_key: true
  end
end
