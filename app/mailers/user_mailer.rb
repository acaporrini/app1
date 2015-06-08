class UserMailer < ApplicationMailer
  default from: "a.caporrini@gmail.com"

  def contact_form(email, name, phone, message)
    @message = message
    @email = email
    @phone = phone
      mail(from: email, 
          to: 'a.caporrini@gmail.com', 
          subject: "A new contact form message from #{name}")
  end
end
