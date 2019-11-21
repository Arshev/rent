class QuickBookingMailer < ApplicationMailer
  default from: 'no-reply@amigorent.ru'

  def new_quick_booking_email
    @quick_booking = params[:quick_booking]
    mail(to: 'amigorent@ya.ru', subject: 'Новая быстрая заявка на бронирование')
  end
end
