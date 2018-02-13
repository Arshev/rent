class QuickBooking < ApplicationRecord
  def send_sms
    @client = Twilio::REST::Client.new
    @client.messages.create(
    from: '+13477089316',
    to: '+79022504797',
    body: "Новая заявка,#{self.name},#{self.contacts},#{self.start_date.strftime("%d-%m-%Y")},#{self.end_date.strftime("%d-%m-%Y")},#{('Седан' if self.is_sedan) || ('Хетчбэк' if self.is_hatch) || ('Кроссовер' if self.is_cross) || ('Минивен' if self.is_minivan) || ('Универсал' if self.is_universal)}"
    )
  end
end
