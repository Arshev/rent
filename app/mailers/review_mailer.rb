class ReviewMailer < ApplicationMailer
  default from: 'notifications@rent.com'

  def review_email
    @review = params[:review]
    mail(to: 'ashev08@gmail.com', subject: 'Новый отзыв')
  end
end
