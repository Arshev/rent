class ContactMailer < ApplicationMailer
  default from: 'no-reply@amigorent.ru'

  def contact_email
    @contact = params[:contact]
    mail(to: 'a.c01@yandex.ru', subject: 'Сообщение со страницы контактов')
  end
end
