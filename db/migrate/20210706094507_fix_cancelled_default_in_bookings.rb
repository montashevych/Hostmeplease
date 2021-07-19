class FixCancelledDefaultInBookings < ActiveRecord::Migration[6.1]
  def change
    change_column_default :bookings, :cancelled, false
  end
end
