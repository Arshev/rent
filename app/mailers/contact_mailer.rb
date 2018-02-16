class ContactMailer < ApplicationMailer
  default from: 'notifications@rent.com'

  def contact_email
    @contact = params[:contact]
    mail(to: 'ashev08@gmail.com', subject: 'Сообщение со страницы контактов')
  end
end
