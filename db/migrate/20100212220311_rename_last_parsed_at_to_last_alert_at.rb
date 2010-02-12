class RenameLastParsedAtToLastAlertAt < ActiveRecord::Migration
  def self.up
    rename_column :feeds, :last_parsed_at, :last_alert_at
  end

  def self.down
    rename_column :feeds, :last_alert_at, :last_parsed_at
  end
end
