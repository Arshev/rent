class CarsController < ApplicationController
  before_action :set_car, except: [:index, :new, :create]
  before_action :authenticate_user!, except: [:show]
  def index
    @cars = current_user.cars
  end

  def new
    @car = current_user.cars.build
  end

  def create
    @car = current_user.cars.build(car_params)
    if @car.save!
      redirect_to listing_car_path(@car), notice: "Сохранено"
    else
      render :new, notice: "Что то пошло не так!"
    end
  end

  def show
  end

  def listing
  end

  def pricing
  end

  def description
  end

  def photo_upload
  end

  def amenities
  end

  def update
    if @car.update(car_params)
      flash[:notice] = "Сохранено"
    else
      flash[:notice] = "Что то не так!"
    end
    redirect_back(fallback_location: request.referer)
  end

  private
    def set_car
      @car = Car.find(params[:id])
    end

    def car_params
      params.require(:car).permit(:car_name, :year, :color, :transmission, :is_air, :engine_capacity, :is_electropackage, :car_class, :car_type, :price_1, :price_2, :price_3, :price_4, :price_main, :deposit, :description, :fuel, :number_doors, :active)
    end
end
