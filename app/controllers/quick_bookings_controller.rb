class QuickBookingsController < ApplicationController
  def create
    @quick_booking = QuickBooking.create(quick_booking_params)
    if @quick_booking.save
      QuickBookingMailer.with(quick_booking: @quick_booking).new_quick_booking_email.deliver_later
      @quick_booking.send_sms
      redirect_to root_path, notice: "Заявка успешно создана! Ожидайте звонка оператора."
    else
      redirect_to root_path, alert: "Что то пошло не так!"
    end
  end

  private

    def quick_booking_params
      params.require(:quick_booking).permit(:start_date, :end_date, :location, :name, :contacts, :is_sedan, :is_hatch, :is_cross, :is_minivan, :is_universal, :start_time, :end_time)
    end
end
