class BookingMailer < ApplicationMailer
  default from: 'notifications@rent.com'

  def new_booking_email
    @booking = params[:booking]
    mail(to: 'ashev08@gmail.com', subject: 'Новая заявка на бронирование')
  end
end
