# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SmsSender, type: :service do
  describe '.send_sms' do
    let(:to) { '+1234567890' }
    let(:body) { 'Test message' }

    context 'when sending an SMS successfully', :vcr do
      it 'logs the SMS' do
        expect(SmsSender).to receive(:log_sms).with(to, body)
        SmsSender.send_sms(to, body)
      end

      it 'creates a new SmsLog entry' do
        expect { SmsSender.send_sms(to, body) }.to change(SmsLog, :count).by(1)
      end
    end

    context 'when there is an error sending SMS', :vcr do
      let(:error_response) { instance_double(HTTParty::Response, code: 500, body: 'Error') }

      before do
        allow(SmsSender).to receive(:post_sms).and_return(error_response)
      end

      it 'does not log the SMS' do
        expect(SmsSender).not_to receive(:log_sms)
        SmsSender.send_sms(to, body)
      end

      it 'logs the error response' do
        expect(Rails.logger).to receive(:error).with("ClickSend Error: #{error_response.body}")
        SmsSender.send_sms(to, body)
      end
    end
  end
end
