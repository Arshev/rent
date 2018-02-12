class QuickBookingMailer < ApplicationMailer
  default from: 'notifications@rent.com'

  def new_quick_booking_email
    @quick_booking = params[:quick_booking]
    mail(to: 'ashev08@gmail.com', subject: 'Новая быстрая заявка на бронирование')
  end
end
