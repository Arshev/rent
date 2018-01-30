class QuickBookingsController < ApplicationController
  def create
    @quick_booking = QuickBooking.create(quick_booking_params)
    if @quick_booking.save
      redirect_to root_path, notice: "Заявка успешно создана! Ожидайте звонка оператора."
    else
      redirect_to root_path, alert: "Что то пошло не так!"
    end
  end

  private

    def quick_booking_params
      params.require(:quick_booking).permit(:start_date, :end_date, :location, :name, :contacts, :is_sedan, :is_hatch, :is_kupe, :is_minivan, :is_universal, :start_time, :end_time)
    end
end
