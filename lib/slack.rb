# frozen_string_literal: true

require 'gif_repo'

# Posts a Slack notification
class Slack
  def self.notify?(amount)
    new(MKR_SLACK_WEBHOOK_URL, amount).notify?
  end

  def initialize(url, amount)
    @url = URI(url)
    @amount = amount
  end

  def notify?
    Net::HTTP.post_form(@url, payload: contents.to_json).code.to_i == 200
  end

  def contents
    {
      text: "$#{@amount} - <#{GifRepo.gif_url}>",
      username: 'Just got paid',
      icon_emoji: ':heavy_dollar_sign:',
      unfurl_links: true
    }
  end
end
