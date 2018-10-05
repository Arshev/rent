class ChangeDatesFormatInBooking < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :days, :integer
    add_column :bookings, :price, :integer
    change_column :bookings, :start_date, :string
    change_column :bookings, :end_date, :string
  end
end
