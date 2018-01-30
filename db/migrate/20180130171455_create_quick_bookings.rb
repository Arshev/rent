class CreateQuickBookings < ActiveRecord::Migration[5.1]
  def change
    create_table :quick_bookings do |t|
      t.string :location
      t.datetime :start_date
      t.datetime :end_date
      t.string :start_time
      t.string :end_time
      t.string :contacts
      t.string :name
      t.boolean :is_sedan
      t.boolean :is_hatch
      t.boolean :is_cross
      t.boolean :is_minivan
      t.boolean :is_universal

      t.timestamps
    end
  end
end
