class AddLatLongToBookings < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :lat, :integer
    add_column :bookings, :long, :integer
  end
end
