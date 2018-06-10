class PagesController < ApplicationController
  def home
    @cars = Car.where(active: true, show_on_main: true)
    @quick_booking = QuickBooking.new
    @reviews = Review.all.limit(9)
    @main_up_text = Text.first.main_up_text
    @main_h1_text = Text.first.main_h1_text
    @main_quick_booking_text = Text.first.main_quick_booking_text
    @main_substances_text = Text.first.main_substances_text
    @main_car_list_text = Text.first.main_car_list_text
    @main_services_text = Text.first.main_services_text
    @main_mission_text = Text.first.main_mission_text
    @main_edge_text = Text.first.main_edge_text
    @footer_text = Text.first.footer_text
  end
end
