class PricesController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :is_authorised, only: [:edit, :update]
  def index
    @cars = Car.all
    @price = Price.first
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
