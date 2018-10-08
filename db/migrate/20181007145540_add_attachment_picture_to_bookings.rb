class AddAttachmentPictureToBookings < ActiveRecord::Migration[5.2]
  def self.up
    change_table :bookings do |t|
      t.attachment :picture
    end
  end

  def self.down
    remove_attachment :bookings, :picture
  end
end
