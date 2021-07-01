class RenameActiveToConfirmedInBookings < ActiveRecord::Migration[6.1]
  def change
    rename_column :bookings, :active, :confirmed
  end
end
