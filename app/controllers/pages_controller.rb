class PagesController < ApplicationController
  def home
    @cars = Car.where(active: true, show_on_main: true)
    @quick_booking = QuickBooking.new
    @reviews = Review.all.limit(9)
    @main_up_text = Text.first.main_up_text
  end
end
