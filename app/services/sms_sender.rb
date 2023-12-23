# frozen_string_literal: true

require 'httparty'

class SmsSender
  include HTTParty
  base_uri 'https://rest.clicksend.com/v3'

  def self.send_sms(to, body)
    response = post_sms(to, body)
    log_sms(to, body) if response.code == 200
    log_response(response)
  end

  def self.log_sms(to, body)
    SmsLog.create(phone_number: to, message: body)
  end

  def self.post_sms(to, body)
    post('/sms/send', basic_auth: auth, body: sms_body(to, body).to_json,
                      headers: { 'Content-Type' => 'application/json' })
  end

  def self.auth
    username = Rails.application.credentials.clicksend[:username]
    api_key = Rails.application.credentials.clicksend[:api_key]
    { username:, password: api_key }
  end

  def self.sms_body(to, body)
    {
      messages: [
        {
          source: 'ruby',
          body:,
          to:
        }
      ]
    }
  end

  def self.log_response(response)
    if response.code == 200
      Rails.logger.info 'SMS sent successfully.'
    else
      Rails.logger.error "ClickSend Error: #{response.body}"
    end
  rescue StandardError => e
    Rails.logger.error "Exception in sending SMS: #{e.message}"
  end
end
