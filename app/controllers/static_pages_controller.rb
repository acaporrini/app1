class StaticPagesController < ApplicationController
  def landing_page

  end
  def index
    @products = Product.limit(3)
  end
  def thank_you
    @name = params[:name]
    @email = params[:email]
    @phone = params[:phone]
    @message = params[:message]
    UserMailer.contact_form(@email, @name, @phone, @message).deliver

    # ActionMailer::Base.mail(:from => @email, 
    #     :to => 'a.caporrini@gmail.com', 
    #     :subject => "A new contact form message from #{@name}", 
    #     :body => (@message).deliver
    # end
  end
end
