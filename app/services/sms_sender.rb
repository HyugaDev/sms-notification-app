# frozen_string_literal: true

# Service to send sms through clicksend
class SmsSender
  def self.send_sms(receiver, body)
    sms_response = ClickSend.new(message: body, receiver:).send_sms
    create_sms_log(receiver, body) if sms_response.code == 200
    log_response(sms_response)
  end

  def self.create_sms_log(receiver, body)
    sms_log = SmsLog.new(phone_number: receiver, message: body)
    if sms_log.save
      Rails.logger.info 'SmsLog created successfully.'
    else
      Rails.logger.error "Errors in saving SmsLog: #{sms_log.errors.full_messages}"
    end
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
