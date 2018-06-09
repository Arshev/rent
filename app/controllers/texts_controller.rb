class TextsController < ApplicationController
  def text_main
    @main_up_text = Text.first.main_up_text
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
    params.require(:text).permit(:main_up_text)
  end
end
