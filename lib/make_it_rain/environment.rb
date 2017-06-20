# frozen_string_literal: true

# TODO(janek): rework to a Configuration object to make reloads easier

# pass this to *every* webhook as a GET param: "?secret=<MKR_APP_SECRET>"
MKR_APP_SECRET = ENV.fetch('MKR_APP_SECRET')

# incoming webhook URL for Slack
MKR_SLACK_WEBHOOK_URL = ENV.fetch('MKR_SLACK_WEBHOOK_URL')

# Braintree config
Braintree::Configuration.environment = ENV['BT_ENV']
Braintree::Configuration.merchant_id = ENV['BT_MERCHANT_ID']
Braintree::Configuration.public_key = ENV['BT_PUBLIC_KEY']
Braintree::Configuration.private_key = ENV['BT_PRIVATE_KEY']
