class DatabaseNormalization < ActiveRecord::Migration[6.1]
  def change
    remove_column :places, :lon
    remove_column :places, :lat

    add_column :addresses, :lon, :float, null: false
    add_column :addresses, :lat, :float, null: false
  end
end
