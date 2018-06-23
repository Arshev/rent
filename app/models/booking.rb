class Booking < ApplicationRecord

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
  has_attached_file :prava, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :prava, content_type: /\Aimage\/.*\z/
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
    begin
      if self.car.length < 3
        @car_name = Car.where("id = '#{self.car}'").first.car_name
      else
        @car_name = self.car
      end
      @client = Twilio::REST::Client.new
      @client.messages.create(
      from: '+13477089316',
      to: '+79082900908',
      body: "Новая заявка,#{self.firstname},#{self.lastname},#{@car_name},#{self.phone},#{self.start_date.strftime("%d-%m-%Y")},#{self.end_date.strftime("%d-%m-%Y")}"
      )
    return true
    rescue Twilio::REST::RestError => error
      @error = error
      return false
    end
  end
end
