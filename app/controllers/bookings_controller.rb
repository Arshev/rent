class BookingsController < ApplicationController
  def create
    @booking = Booking.create(booking_params)
    if @booking.save
      redirect_to root_path, notice: "Заявка успешно создана! Ожидайте звонка оператора."
    else
      redirect_to root_path, alert: "Что то пошло не так!"
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def index
    @bookings = current_user.bookings
  end

  def new
    @booking = current_user.bookings.build
    if params[:car_id]
      @car = Car.find(params[:car_id])
    end
    @cars = Car.all
  end

  private

    def booking_params
      params.require(:booking).permit(:start_date, :end_date, :location_start, :location_end, :firstname, :lastname, :middlename, :baby_chair, :phone, :email, :car)
    end
end
