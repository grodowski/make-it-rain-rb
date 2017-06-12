# Make It Rain

[![Build Status](https://travis-ci.org/grodowski/make-it-rain-rb.svg?branch=master)](https://travis-ci.org/grodowski/make-it-rain-rb)
[![codebeat badge](https://codebeat.co/badges/9170aae8-c902-4884-ad48-919dd43c54b1)](https://codebeat.co/projects/github-com-grodowski-make-it-rain-rb-master)

Credits to @fitztrev for an excellent idea! Check the original PHP/Slack/Stripe version https://github.com/fitztrev/make-it-rain. This is a weekend rewrite using Ruby, plain old Rack, Braintree, Slack and Docker Cloud, that just brings make-it-rain awesomeness to any application by using containers. 🙃 Get a random "make it rain" gif every time you get paid through Braintree!

Works with Slack and Braintree.

![screenshot](https://i.imgur.com/gU7gFBW.gif)

Current selection of gifs: https://fitztrev.github.io/make-it-rain/

Send pull requests to the `gh-pages` branch to add more.

## How to use

1) Check out the Docker image: https://hub.docker.com/r/mrgrodo/make-it-rain/

2) Create a ["Successful Charge" webhook in Braintree](https://developers.braintreepayments.com/guides/webhooks/overview)

2) Provide environment variables with your Braintree webhook and a Slack access token - `environment.rb` loads them all.

## Contributing gifs

New gifs are welcomed and encouraged. Check the [existing ones](https://github.com/fitztrev/make-it-rain/tree/gh-pages), grab the [`gh-pages`](https://github.com/fitztrev/make-it-rain/tree/gh-pages) branch of this repo, and submit a pull request to add one.
