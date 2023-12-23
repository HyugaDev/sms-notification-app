# frozen_string_literal: true

# spec/models/user_spec.rb

require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email).case_insensitive }
  it { should validate_presence_of(:password) }

  describe '#send_welcome_sms' do
    let(:user) { build(:user) }

    it 'triggers send_welcome_sms after creation' do
      expect(user).to receive(:send_welcome_sms)
      user.save
    end

    it 'enqueues a job to send welcome SMS' do
      expect do
        user.save
      end.to have_enqueued_job(SmsNotificationJob).with(user, "Welcome to our service, #{user.name}!")
    end
  end

  describe '#send_password_change_sms' do
    let(:user) { create(:user) }

    it 'triggers send_password_change_sms after password update' do
      expect(user).to receive(:send_password_change_sms)
      user.update(password: 'new_password', password_confirmation: 'new_password')
    end

    it 'enqueues a job to send password change SMS' do
      expect do
        user.update(password: 'new_password', password_confirmation: 'new_password')
      end.to have_enqueued_job(SmsNotificationJob).with(user, "#{user.name}, your password was changed successfully.")
    end
  end
end
