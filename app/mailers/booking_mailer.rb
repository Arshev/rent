class BookingMailer < ApplicationMailer
  default from: 'no-reply@amigorent.ru'

  def new_booking_email
    @booking = params[:booking]
    mail(to: 'a.c01@yandex.ru', subject: 'Новая заявка на бронирование')
  end
end
