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
    @booking = Booking.new
    if params[:car_id]
      @car = Car.find(params[:car_id])
    else
      @cars = Car.all
      gon.cars_info = @cars
    end
  end

  def change_car_info
    car_id = params[:car_id]
    @car_info = Car.find_by car_id: car_id
    respond_to do |format|
      format.json { render json: @car_info }
    end
  end

  private

    def booking_params
      params.require(:booking).permit(:start_date, :end_date, :location_start, :location_end, :firstname, :lastname, :middlename, :baby_chair, :phone, :email, :car, :navigator, :accept)
    end
end
