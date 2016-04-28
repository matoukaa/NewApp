if Rails.env.production?
	Rails.configuration.stripe = {
		:publishable_key => ENV['STRIPE_PUBLISHABLE_KEY'],
		:secret_key => ENV['STRIPE_SECRET_KEY']
	}
else
	Rails.configuration.stripe = {
		:publishable_key => 'pk_test_4AGwQ5r7X0I2bkPpzQsneC07',
		:secret_key => 'sk_test_T19sY3yW8bxVXS1twjnSOlEJ'
	}
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]
