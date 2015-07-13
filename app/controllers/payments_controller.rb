class PaymentsController < ApplicationController
  def new
  end
  def create
    token = params[:stripeToken]
    @amount = params[:price].to_f * 100
    @email = params[:stripeEmail]
    #@product = Product.find(params[:product_id])
    #a better email template must be set
    @message = "Congratulations! You have completed your order at BikeBln for #{ sprintf('%.2f', @amount / 100) } €"

    
    begin
      charge = Stripe::Charge.create(
        amount: @amount.to_i, 
        currency: "eur",
        source: token,
        description:  params[:stripeEmail]
      )

      UserMailer.payment_notification(@email, @message).deliver

    rescue Stripe::CardError => e
     
      body = e.json_body
      err  = body[:error]

    end
      respond_to do |format|
        format.js
      end
  end

end
