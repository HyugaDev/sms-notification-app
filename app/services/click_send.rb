# frozen_string_literal: true

require 'httparty'

# Service to send sms through clicksend
class ClickSend
  include HTTParty
  BASE_URL = 'https://rest.clicksend.com/v3'

  def initialize(message:, receiver:)
    @message = message
    @receiver = receiver
  end

  def send_sms
    HTTParty.post("#{BASE_URL}/sms/send", basic_auth: auth, body: sms_body.to_json,
                                          headers: { 'Content-Type' => 'application/json' })
  end

  private

  def auth
    username = Rails.application.credentials.clicksend[:username]
    api_key = Rails.application.credentials.clicksend[:api_key]
    { username:, password: api_key }
  end

  def sms_body
    {
      messages: [
        {
          source: 'ruby',
          body: @message,
          to: @receiver
        }
      ]
    }
  end
end
