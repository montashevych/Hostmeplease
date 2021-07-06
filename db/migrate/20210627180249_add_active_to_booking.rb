class AddActiveToBooking < ActiveRecord::Migration[6.1]
  def change
    add_column :bookings, :active, :boolean
  end
end
