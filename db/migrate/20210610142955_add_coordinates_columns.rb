class AddCoordinatesColumns < ActiveRecord::Migration[6.1]
  def change
    add_column :places, :lon, :decimal, default: 0.0
    add_column :places, :lat, :decimal, default: 0.0
  end
end
