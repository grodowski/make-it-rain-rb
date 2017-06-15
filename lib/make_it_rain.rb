# frozen_string_literal: true
Bundler.require
require 'environment'
require 'slack'

# Main application
class MakeItRain
  extend Forwardable
  def_delegator :@req, :params

  def call(env)
    @req = Rack::Request.new(env)
    return [401, {}, []] unless secret_valid?
    amount = parse_amount
    return [200, {}, ['event skipped']] unless amount
    return [422, {}, ['notification failed']] unless Slack.notify?(amount)
    [204, { 'Content-Length' => '0' }, []]
  end

  private

  def secret_valid?
    sc = params['secret']
    sc && sc == MKR_APP_SECRET
  end

  # TODO: add tests & refactor in a separate PR!
  # rubocop:disable Metrics/AbcSize
  def parse_amount
    return process_chargebee unless params['bt_signature']
    bt_parsed = Braintree::WebhookNotification.parse(
      params['bt_signature'], params['bt_payload']
    )
    if bt_parsed.kind ==
       Braintree::WebhookNotification::Kind::SubscriptionChargedSuccessfully
      return bt_parsed.subscription.transactions.first.amount.to_f
    end
    nil
  end

  def process_chargebee
    req_body = JSON.parse(@req.body.read)
    cb_amt = req_body.dig('content', 'transaction', 'amount')
    return cb_amt / 100 if cb_amt
  end
end
