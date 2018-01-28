class ReservationsController < ApplicationController

  def create
    car = Car.find(params[:car_id])

    start_date = Date.parse(reservation_params[:start_date])
    end_date = Date.parse(reservation_params[:end_date])
    days = (end_date - start_date).to_i

    @reservation = car.reservations.build(reservation_params)
    if days > 3
      @reservation.price = car.price_2
    elsif days > 7
      @reservation.price = car.price_3
    elsif days > 14
      @reservation.price = car.price_4
    else
      @reservation.price = car.price_1
    end
    @reservation.total = @reservation.price * days
    @reservation.days = days
    @reservation.save

    flash[:notice] = "Заявка успешно создана! Ожидайте звонка оператора."
    redirect_to car
  end

  private
    def reservation_params
      params.require(:reservation).permit(:start_date, :end_date)
    end
end
