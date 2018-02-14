class PricesController < ApplicationController
  def index
    @cars = Car.where("active = 'true'")
  end
end
