class UserMailer < ApplicationMailer
	default from: "matoukaa@gmail.com"

	def contact_form(email, name, message)
  	@message = message
  		mail(:from => @email, 
  		:to => 'matoukaa@gmail.com',
  		:subject => "A new contact form message from #{@name}")
  end
end
