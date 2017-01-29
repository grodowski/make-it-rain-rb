# frozen_string_literal: true
MKR_APP_SECRET = ENV.fetch('MKR_APP_SECRET')
MKR_SLACK_WEBHOOK_URL = ENV.fetch('MKR_SLACK_WEBHOOK_URL')
Braintree::Configuration.environment = ENV.fetch('BT_ENV')
Braintree::Configuration.merchant_id = ENV.fetch('BT_MERCHANT_ID')
Braintree::Configuration.public_key = ENV.fetch('BT_PUBLIC_KEY')
Braintree::Configuration.private_key = ENV.fetch('BT_PRIVATE_KEY')
