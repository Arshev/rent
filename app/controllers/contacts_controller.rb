class ContactsController < ApplicationController
  def index
    @contacts_text = Text.first.contacts_text
    @footer_text = Text.first.footer_text
    @contacts_title = Text.first.contacts_title
    @contacts_description = Text.first.contacts_description
  end
  def create
    @contact = Contact.create(contact_params)
    if verify_recaptcha(model: @contact) && @contact.save
      ContactMailer.with(contact: @contact).contact_email.deliver_later
      redirect_back(fallback_location: request.referer, notice: "Ваше сообщение успешно отправлено!")
    else
      redirect_back(fallback_location: request.referer, alert: "Вы заполнили не все поля!")
    end
  end

  private

    def contact_params
      params.require(:contact).permit(:name, :email, :phone, :message)
    end
end
