class Api::V1::CarsController < ApiController
    before_action :set_car, only: [:show]
    before_action :set_cars, only: [:index]

    def show
        render json: @car
    end

    def index
        render json: @cars
    end

    private
        def set_car
            @car = Car.find(params[:id])
        end
        def set_cars
            @cars = Car.all
        end
  end
