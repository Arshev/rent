class PagesController < ApplicationController
  def home
    @cars = Car.where(active: true).limit(3)
    @quick_booking = QuickBooking.new
  end
end
