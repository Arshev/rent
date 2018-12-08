class Api::V1::CarsController < ApiController

    before_action :set_car, only: [:show, :update]
    before_action :set_cars, only: [:index]

    def show
        render json: @car
    end

    def index
        render json: @cars
    end

    def create
        car = Car.new(car_params)
        if car.save
            render json: car, adapter: :json, status: 201
        else
            render json: { error: car.errors }, status: 422
        end
    end

    def update
        if @car.update(car_params)
            render json: @car, adapter: :json, status: 200
        else
            render json: { error: @car.errors }, status: 422
        end
    end

    private
        def set_car
            @car = Car.find(params[:id])
        end
        def set_cars
            @cars = Car.all
        end
        def car_params
            params.require(:car).permit(:car_name, :year, :color, :transmission, :is_air, :engine_capacity, :is_electropackage, :car_class, :car_type, :price_1, :price_2, :price_3, :price_4, :price_5, :old_price_1, :old_price_2, :old_price_3, :old_price_4, :old_price_5, :price_hour, :price_main, :deposit, :description, :fuel, :number_doors, :active, :sort, :show_on_main)
        end
  end
