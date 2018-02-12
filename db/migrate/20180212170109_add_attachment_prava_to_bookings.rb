class AddAttachmentPravaToBookings < ActiveRecord::Migration[5.1]
  def self.up
    change_table :bookings do |t|
      t.attachment :prava
    end
  end

  def self.down
    remove_attachment :bookings, :prava
  end
end
