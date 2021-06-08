class AddIndexForCountries < ActiveRecord::Migration[6.1]
  def change
    add_index :countries, :country_name, unique: true
  end
end
