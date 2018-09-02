class TextsController < ApplicationController
  def text_main
    @main_up_text = Text.first.main_up_text
    @main_h1_text = Text.first.main_h1_text
    @main_quick_booking_text = Text.first.main_quick_booking_text
    @main_substances_text = Text.first.main_substances_text
    @main_car_list_text = Text.first.main_car_list_text
    @main_services_text = Text.first.main_services_text
    @main_mission_text = Text.first.main_mission_text
    @main_edge_text = Text.first.main_edge_text
    @footer_text = Text.first.footer_text
    @prices_text = Text.first.prices_text
    @contacts_text = Text.first.contacts_text
    @bookings_bottom_text = Text.first.bookings_bottom_text
    @reviews_text = Text.first.reviews_text
    @terms_text = Text.first.terms_text
    @faqs_text = Text.first.faqs_text
    @about_text = Text.first.about_text
  end

  def update
    if Text.update(text_params)
      flash[:notice] = "Сохранено"
    else
      flash[:alert] = "Что то не так!"
    end
    redirect_back(fallback_location: request.referer)
  end
private
  def text_params
    params.require(:text).permit(:main_up_text, :main_h1_text, 
      :main_quick_booking_text, :main_substances_text, 
      :main_car_list_text, :main_services_text, 
      :main_mission_text, :main_edge_text, 
      :footer_text, :prices_text, :prices_bottom_text, 
      :contacts_text, :bookings_bottom_text, 
      :reviews_text, :terms_text, :faqs_text, 
      :about_text, :home_description, :home_title, 
      :bookings_title, :bookings_description,
      :cars_title, :cars_description, :prices_title, 
      :prices_description, :contacts_title, :contacts_description,
      :reviews_title, :reviews_description,
      :terms_title, :terms_description, :faqs_title, :faqs_description,
      :abouts_title, :abouts_description)
  end
end
