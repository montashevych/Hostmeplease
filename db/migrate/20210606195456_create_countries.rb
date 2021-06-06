class CreateCountries < ActiveRecord::Migration[6.1]
  def change
    create_table :countries do |t|
      t.string :country_name
      t.references :place, null: false, foreign_key: true

      t.timestamps
    end
  end
end
