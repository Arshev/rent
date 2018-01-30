class PagesController < ApplicationController
  def home
    @cars = Car.where(active: true).limit(9)
  end
end
