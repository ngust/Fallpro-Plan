class MainMailer < ApplicationMailer

  def sample_email(user)
    @user = user
    mail(to: @user.email, subject: 'Sample Email')
  end

  def contact_me(message)
  	@greeting = "Hi"
  	@body = message.body
  	@email = message.email
  	@name = message.name
  	mail to: "qb@wethesafe.com", from: "qb@wethesafe.com"
  end


  def fallpro_report(fallpro, email)
    @fallpro = Fallpro.find(fallpro)
      mail to: email.email, from: "qb@wethesafe.com"
  end


end
