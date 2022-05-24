class ContactMailer < ApplicationMailer
  def contact_mail(contact)
    @contact = contact
    mail to:"My email address", subject: "Contact Us"
  end
end
