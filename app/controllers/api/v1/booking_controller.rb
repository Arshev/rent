class Api::V1::BookingController < ApiController
    def create
        @booking = Booking.new(booking_params)
        if @booking.save!
            
            @booking.send_sms
            BookingMailer.with(booking: @booking).new_booking_email.deliver_later
            render json: @booking, adapter: :json, status: :created
        else
            render json: { error: @booking.errors }, status: :unprocessable_entity
        end
    end

    private
    def booking_params
        params.require(:booking).permit(:start_date, :end_date, :location_start, :location_end, :firstname, :lastname, :middlename, :baby_chair, :phone, :email, :car, :navigator, :accept, :avatar, :prava, :car_id, :days, :price, :total, :picture)
    end
end
