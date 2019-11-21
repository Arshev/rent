class BookingMailer < ApplicationMailer
  default from: 'no-reply@amigorent.ru'

  def new_booking_email
    @booking = params[:booking]
    mail(to: 'amigorent@ya.ru', subject: 'Новая заявка на бронирование')
  end
end
