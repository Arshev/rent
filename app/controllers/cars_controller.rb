class CarsController < ApplicationController
  before_action :set_car, except: [:index, :new, :create]
  before_action :authenticate_user!, except: [:show, :index]
  before_action :is_authorised, only: [:listing, :pricing, :description, :photo_upload, :amenities, :update, :destroy]
  before_action :set_photos, only: [:photo_upload, :show]

  def index
    @cars = Car.all
    @footer_text = Text.first.footer_text
    @cars_title = Text.first.cars_title
    @cars_description = Text.first.cars_description
  end

  def new
    @car = current_user.cars.build
  end

  def create
    @car = current_user.cars.build(car_params)
    if @car.save
      redirect_to cars_admin_path, notice: "Сохранено"
    else
      redirect_back(fallback_location: request.referer, alert: "Что то не так!")
    end
  end

  def destroy
    if @car.destroy
      redirect_to root_path, notice: "Удалено"
    else
      flash[:alert] = "Что то не так!"
    end
  end

  def show
    @photos = @car.photos
    @footer_text = Text.first.footer_text
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
    new_params = car_params
    new_params = car_params.merge(active: true) if is_ready_car

    if @car.update(new_params)
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

    def is_authorised
      redirect_to root_path, alert: "У вас нет прав на просмотр данной страницы!" unless current_user.id == @car.user_id || current_user.is_admin
    end

    def is_ready_car
      !@car.active && !@car.price_1.blank? && !@car.price_2.blank? && !@car.price_3.blank? && !@car.price_4.blank? && !@car.price_5.blank? && !@car.price_hour.blank? && !@car.price_main.blank? && !@car.car_name.blank? && !@car.photos.blank?
    end

    def set_photos
      @photos = @car.photos
    end

    def car_params
      params.require(:car).permit(:car_name, :year, :color, :transmission, :is_air, :engine_capacity, :is_electropackage, :car_class, :car_type, :price_1, :price_2, :price_3, :price_4, :price_5, :old_price_1, :old_price_2, :old_price_3, :old_price_4, :old_price_5, :price_hour, :price_main, :deposit, :description, :fuel, :number_doors, :active, :sort, :show_on_main)
    end
end
