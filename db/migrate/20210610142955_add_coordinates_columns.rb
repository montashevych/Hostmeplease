class AddCoordinatesColumns < ActiveRecord::Migration[6.1]
  def change
    add_column :places, :lon, :float, default: 0.0
    add_column :places, :lat, :float, default: 0.0
  end
end
