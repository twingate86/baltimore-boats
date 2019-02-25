if Rails.env.production?
  Rails.configuration.stripe = {
    publishable_key: ENV['STRIPE_PUBLISHABLE_KEY'],
    secret_key: ENV['STRIPE_SECRET_KEY']
  }
else
  Rails.configuration.stripe = {
    publishable_key: 'pk_test_0UEzugBlCOedRavNTVT4JWrx',
    secret_key: 'sk_test_jWNZ4dH9RD74KKhDyEn0ayJq'
  }
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]