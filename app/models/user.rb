# frozen_string_literal: true

# User model to store user details
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  after_create :send_welcome_sms
  after_update :send_password_change_sms, if: :saved_change_to_encrypted_password?

  private

  def send_welcome_sms
    SmsNotificationJob.perform_later(self, "Welcome to our service, #{name}!")
  end

  def send_password_change_sms
    SmsNotificationJob.perform_later(self, "#{name}, your password was changed successfully.")
  end
end
