class CreateBookings < ActiveRecord::Migration[5.1]
  def change
    create_table :bookings do |t|
      t.string :car
      t.boolean :baby_chair
      t.boolean :navigator
      t.boolean :accept
      t.datetime :start_date
      t.datetime :end_date
      t.string :location_start
      t.string :location_end
      t.string :firstname
      t.string :lastname
      t.string :middlename
      t.string :phone
      t.string :email
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
