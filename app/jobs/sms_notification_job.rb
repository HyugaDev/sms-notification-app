class SmsNotificationJob < ApplicationJob
  queue_as :default

  def perform(user, message)
    SmsSender.send_sms(user.phone_number, message)
  end
end
