class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.string :title
      t.string :status
      t.string :location
      t.datetime :start_datetime
      t.datetime :end_datetime
      t.string :cost
      t.references :package, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
