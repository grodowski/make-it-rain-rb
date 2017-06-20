# Make It Rain

[![Build Status](https://travis-ci.org/grodowski/make-it-rain-rb.svg?branch=master)](https://travis-ci.org/grodowski/make-it-rain-rb)
[![codebeat badge](https://codebeat.co/badges/9170aae8-c902-4884-ad48-919dd43c54b1)](https://codebeat.co/projects/github-com-grodowski-make-it-rain-rb-master)

Credits to @fitztrev for an excellent idea! Check the original PHP/Slack/Stripe version https://github.com/fitztrev/make-it-rain. This is a weekend rewrite using Ruby, plain old Rack and Docker. Get a random "make it rain" gif posted to a Slack channel every time you get paid through Braintree or Chargebee!

![screenshot](https://i.imgur.com/gU7gFBW.gif)

Current selection of gifs: https://fitztrev.github.io/make-it-rain/

Send pull requests to the `gh-pages` branch of the original repo by @fitztrev to add more.

## How to use

1) Check out the Docker image: https://hub.docker.com/r/mrgrodo/make-it-rain-rb/

2) Create a ["Successful Charge" webhook in Braintree](https://developers.braintreepayments.com/guides/webhooks/overview) or a general purpose Chargebee webhook in your [webhook settings](https://www.chargebee.com/docs/webhook_settings.html). Make sure to point the webhook to an instance of this service with a correct `secret` parameter: `https://my-make-it-rain-instance.com/?secret=your-mkr-app-secret`.

3) Provide environment variables to the container and a Slack access token - `environment.rb` loads them all.

```rb
# pass this to *every* webhook as a GET param: "?secret=<MKR_APP_SECRET>"
MKR_APP_SECRET = ENV.fetch('MKR_APP_SECRET')

# incoming webhook URL for Slack
MKR_SLACK_WEBHOOK_URL = ENV.fetch('MKR_SLACK_WEBHOOK_URL')

# Braintree config
Braintree::Configuration.environment = ENV['BT_ENV']
Braintree::Configuration.merchant_id = ENV['BT_MERCHANT_ID']
Braintree::Configuration.public_key = ENV['BT_PUBLIC_KEY']
Braintree::Configuration.private_key = ENV['BT_PRIVATE_KEY']
```

4) Run the container - check out `run.sh` for development and as an example for your deployment.

## Contributing gifs

New gifs are welcomed and encouraged. Check the [existing ones](https://github.com/fitztrev/make-it-rain/tree/gh-pages), grab the [`gh-pages`](https://github.com/fitztrev/make-it-rain/tree/gh-pages) branch of this repo, and submit a pull request to add one.
