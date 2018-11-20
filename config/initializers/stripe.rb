if Rails.env.production?
  Rails.configuration.stripe = {
  	publishable_key: ENV['STRIPE_PUBLISHABLE_KEY'],
  	secret_key: ENV['STRIPE_SECRET_KEY']
  }
else
  Rails.configuration.stripe = {
  	publishable_key: 'pk_test_k6Y7fMN6MeJ0pmmjvAYRsOb9',
  	secret_key: 'sk_test_hSc7aT5RdWWPZY3wkY2ruhRQ'
  }
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]