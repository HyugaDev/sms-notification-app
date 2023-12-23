class CreateSmsLogs < ActiveRecord::Migration[7.1]
  def change
    create_table :sms_logs do |t|
      t.string :phone_number
      t.string :message

      t.timestamps
    end
  end
end
