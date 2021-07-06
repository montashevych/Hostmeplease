class AddDefaultValueToCancelledInBookings < ActiveRecord::Migration[6.1]
  def change
    change_column_default :bookings, :cancelled, true
  end
end
