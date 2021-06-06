class AddCityToCountry < ActiveRecord::Migration[6.1]
  def change
    add_reference :countries, :city, null: false, foreign_key: true
  end
end
