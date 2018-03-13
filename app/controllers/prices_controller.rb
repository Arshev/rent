class PricesController < ApplicationController
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
    def prices_params
      params.require(:price).permit(:price_date)
    end
end
