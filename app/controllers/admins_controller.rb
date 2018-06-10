class AdminsController < ApplicationController
  def show
  end
  def cars
    @cars = Car.all
  end
  def text_main
    @text = Text.first
  end
end
