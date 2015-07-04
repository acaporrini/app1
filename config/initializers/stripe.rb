if Rails.env.production?
  Rails.configuration.stripe = {
    :publishable_key => ENV['STRIPE_PUBLISHABLE_KEY'],
    :secret_key      => ENV['STRIPE_SECRET_KEY']
  }
else
  Rails.configuration.stripe = {
    :publishable_key => 'pk_test_8zjoHGwfgDL1bgfYZi5D8EQC',
    :secret_key      => 'sk_test_lJhQtb7uWIA7zIWylVuUUcR5'
  }
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]