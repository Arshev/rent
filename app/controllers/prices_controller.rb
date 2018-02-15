class PricesController < ApplicationController
  def index
    @cars = Car.all
  end
end
