class AdminsController < ApplicationController
  before_action :set_text, only: [:text_main, :text_other]
  before_action :set_car, only: [:edit_car]

  def show
  end
  def cars
    @cars = Car.all
  end
  def edit_car
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
end
