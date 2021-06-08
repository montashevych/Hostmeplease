class CreateCities < ActiveRecord::Migration[6.1]
  def change
    create_table :cities do |t|
      t.string :city_name
      t.references :country, :place, null: false, foreign_key: true

      t.timestamps
    end
  end
end
