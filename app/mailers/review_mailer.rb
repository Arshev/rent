class ReviewMailer < ApplicationMailer
  default from: 'no-reply@amigorent.ru'

  def review_email
    @review = params[:review]
    mail(to: 'amigorent@ya.ru', subject: 'Новый отзыв')
  end
end
