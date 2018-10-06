class Booking < ApplicationRecord

  # has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }
  # validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
  # has_attached_file :prava, styles: { medium: "300x300>", thumb: "100x100>" }
  # validates_attachment_content_type :prava, content_type: /\Aimage\/.*\z/

  has_many_attached :documents

  default_scope {order('created_at DESC')}

  def cover_avatar(size)
    if self.avatar
      self.avatar.url(size)
    else
      "blank.jpg"
    end
  end

  def cover_prava(size)
    if self.prava
      self.prava.url(size)
    else
      "blank.jpg"
    end
  end

  def send_sms
    message = MainsmsApi::Message.new(message: "#{self.firstname} авто: #{self.car} тел: #{self.phone} с #{self.start_date} до #{self.end_date}", recipients: ['79022504797'])
    response = message.deliver
  end
end
