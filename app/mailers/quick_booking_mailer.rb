class QuickBookingMailer < ApplicationMailer
  default from: 'no-reply@amigorent.ru'

  def new_quick_booking_email
    @quick_booking = params[:quick_booking]
    mail(to: 'a.c01@yandex.ru', subject: 'Новая быстрая заявка на бронирование')
  end
end
