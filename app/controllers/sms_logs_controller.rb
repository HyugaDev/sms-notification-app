# frozen_string_literal: true

# Controller to display all sms logs
class SmsLogsController < ApplicationController
  def index
    @sms_logs = SmsLog.all
  end
end
