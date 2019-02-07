class UserMailer < ApplicationMailer
      default from: "thom.wingate@gmail.com"
    
       def contact_form(email, name, message)
       @message = message
       mail(from: email,
         to: 'thom.wingate@gmail.com',
         subject: "A new contact form message from #{name}")
  end
end
