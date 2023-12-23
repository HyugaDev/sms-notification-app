# frozen_string_literal: true

class SmsLogsController < ApplicationController
  def index
    @sms_logs = SmsLog.all
  end
end
