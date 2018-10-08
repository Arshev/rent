class AddAttachmentAvatarToBookings < ActiveRecord::Migration[5.1]
  def self.up
    change_table :bookings do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :bookings, :avatar
  end
end
