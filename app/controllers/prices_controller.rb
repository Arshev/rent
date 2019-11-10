class PricesController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :is_authorised, only: [:edit, :update]
  def index
    @cars = Car.all
    @price = Price.first
    @prices_text = Text.first.prices_text
    @prices_bottom_text = Text.first.prices_bottom_text
    @footer_text = Text.first.footer_text
    @prices_title = Text.first.prices_title
    @prices_description = Text.first.prices_description
    @dop_table_worktime = Text.first.dop_table_worktime
    @dop_table_endtime = Text.first.dop_table_endtime
    @dop_table_city_price_worktime = Text.first.dop_table_city_price_worktime
    @dop_table_city_price_endtime = Text.first.dop_table_city_price_endtime
    @dop_table_aero_price_worktime = Text.first.dop_table_aero_price_worktime
    @dop_table_aero_price_endtime = Text.first.dop_table_aero_price_endtime
    @dop_table_svetlogorsk_price_worktime = Text.first.dop_table_svetlogorsk_price_worktime
    @dop_table_svetlogorsk_price_endtime = Text.first.dop_table_svetlogorsk_price_endtime
    @dop_table_zelenogradsk_price_worktime = Text.first.dop_table_zelenogradsk_price_worktime
    @dop_table_zelenogradsk_price_endtime = Text.first.dop_table_zelenogradsk_price_endtime
    @dop_table_kosa_price_worktime = Text.first.dop_table_kosa_price_worktime
    @dop_table_kosa_price_endtime = Text.first.dop_table_kosa_price_endtime
    @dop_table_kreslo_dayprice = Text.first.dop_table_kreslo_dayprice
    @dop_table_kreslo_allprice = Text.first.dop_table_kreslo_allprice
    @dop_table_navigator_dayprice = Text.first.dop_table_navigator_dayprice
    @dop_table_downtext = Text.first.dop_table_downtext
  end

  def edit
    @price = Price.first
  end

  def update
    @price = Price.first
    if @price.update(prices_params)
      flash[:notice] = "Сохранено"
    else
      flash[:notice] = "Что то не так!"
    end
    redirect_back(fallback_location: request.referer)
  end

  private
    def is_authorised
      redirect_to root_path, alert: "У вас нет прав на просмотр данной страницы!" unless current_user.is_admin?
    end
    def prices_params
      params.require(:price).permit(:price_date)
    end
end
