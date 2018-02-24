class ContactsController < ApplicationController
  def index
  end
  def create
    @contact = Contact.create(contact_params)
    if verify_recaptcha(model: @contact) && @contact.save
      ContactMailer.with(contact: @contact).contact_email.deliver_later
      redirect_to root_path, notice: "Ваше сообщение успешно отправлено!"
    else
      redirect_to root_path, alert: "Что то пошло не так!"
    end
  end

  private

    def contact_params
      params.require(:contact).permit(:name, :email, :phone, :message)
    end
end
