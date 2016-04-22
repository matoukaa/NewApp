class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def thank_you
  	@name = params[:name]
  	@email = params[:email]
  	@message = params[:message]
  	ActionMailer::Base.mail(:from => @email, 
  		:to => 'matoukaa@gmail.com',
  		:subject => "A new contact form message from #{@name}",
  		:body => @message).deliver_now
  end
end
