class QuickBooking < ApplicationRecord
  validates :name, presence: true
  validates :contacts, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  def send_sms
    message = MainsmsApi::Message.new(message: "Новая заявка от #{self.name},#{self.contacts},с #{self.start_date.strftime("%d-%m-%Y")} до #{self.end_date.strftime("%d-%m-%Y")} кузов: #{('Седан' if self.is_sedan) || ('Хетчбэк' if self.is_hatch) || ('Кроссовер' if self.is_cross) || ('Минивен' if self.is_minivan) || ('Универсал' if self.is_universal)}", recipients: ['79022504797'])
    response = message.deliver
  end
end
