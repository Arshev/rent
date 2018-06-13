class AdminsController < ApplicationController
  before_action :set_text, only: [:text_main, :text_other]
  before_action :set_car, only: [:edit_car, :upload_photos]
  before_action :set_photos, only: [:edit_car, :upload_photos]

  def show
  end
  def cars
    @cars = Car.all
  end
  def new_car
    @car = current_user.cars.build
  end
  def edit_car
  end
  def upload_photos
  end
  def text_main
  end
  def text_other
  end

  private

    def set_car
      @car = Car.find(params[:id])
    end
    def set_text
      @text = Text.first
    end
    def set_photos
      @photos = @car.photos
    end
end
