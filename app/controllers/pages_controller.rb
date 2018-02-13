class PagesController < ApplicationController
  def home
    @cars = Car.where(active: true).limit(3)
    @quick_booking = QuickBooking.new
    @reviews = Review.all.limit(9)
  end
end
