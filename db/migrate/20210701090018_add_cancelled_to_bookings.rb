class AddCancelledToBookings < ActiveRecord::Migration[6.1]
  def change
    add_column :bookings, :cancelled, :boolean
  end
end
