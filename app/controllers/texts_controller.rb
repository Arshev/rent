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
  end
  def update
    if Text.update(text_params)
      flash[:notice] = "Сохранено"
    else
      flash[:notice] = "Что то не так!"
    end
    redirect_back(fallback_location: request.referer)
  end
private
  def text_params
    params.require(:text).permit(:main_up_text, :main_h1_text, :main_quick_booking_text, :main_substances_text, :main_car_list_text, :main_services_text, :main_mission_text, :main_edge_text, :footer_text)
  end
end
