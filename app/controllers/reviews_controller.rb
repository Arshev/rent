class ReviewsController < ApplicationController
  def create
    @review = Review.create(review_params)
    if verify_recaptcha(model: @review) && @review.save
      ReviewMailer.with(review: @review).review_email.deliver_later
      redirect_back(fallback_location: request.referer, notice: "Отзыв успешно создан! Он будет проверен на предмет рекламы и размещен.")
    else
      redirect_back(fallback_location: request.referer, alert: "Что то пошло не так!")
    end
  end

  def index
    @reviews = Review.all # Pagination!!!
    @reviews_text = Text.first.reviews_text
    @footer_text = Text.first.footer_text
    @reviews_title = Text.first.reviews_title
    @reviews_description = Text.first.reviews_description
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    @reviews = Review.all

    respond_to :js
  end

  def approve
    @review = Review.find(params[:id])
    @review.active = true
    @review.save
    redirect_back(fallback_location: request.referer, notice: "Отзыв одобрен!")
  end

  private
    def review_params
      params.require(:review).permit(:text, :star, :active, :name, :email)
    end
end
