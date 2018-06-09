class AdminsController < ApplicationController
  def show
  end
  def cars
    @cars = Car.all
  end
end
