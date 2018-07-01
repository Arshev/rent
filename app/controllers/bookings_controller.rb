class BookingsController < ApplicationController
  before_action :set_booking, only: [:show]
  before_action :authenticate_user!, only: [:show, :index]
  def create
    @booking = Booking.create(booking_params)
    if @booking.save
      @booking.send_sms
      BookingMailer.with(booking: @booking).new_booking_email.deliver_later
      redirect_to root_path, notice: "Заявка успешно создана! Ожидайте звонка оператора. Обработка заявки производится в течение суток"
    else
      redirect_to root_path, alert: "Что то пошло не так!"
    end
  end

  def show
  end

  def index
    @bookings = Booking.all
  end

  def new
    @bookings_bottom_text = Text.first.bookings_bottom_text
    @footer_text = Text.first.footer_text
    @booking = Booking.new
    if params[:car_id]
      @car = Car.find(params[:car_id])
    else
      @cars = Car.all.sort_by { |obj| obj.id }
      gon.cars_info = @cars
    end
  end

  def document_uploads
    @booking = Booking.find(params[:id])
    @documents = @booking.documents
  end

  private

    def set_booking
      @booking = Booking.find(params[:id])
    end

    def set_documents
      @documents = @booking.documents
    end

    def booking_params
      params.require(:booking).permit(:start_date, :end_date, :location_start, :location_end, :firstname, :lastname, :middlename, :baby_chair, :phone, :email, :car, :navigator, :accept, :avatar, :prava, :car_id)
    end
end
