class FeedRenameLastAlertAtToBeginParsingAfter < ActiveRecord::Migration
  def self.up
    rename_column :feeds, :last_alert_at, :begin_parsing_after
  end

  def self.down
    rename_column :feeds, :begin_parsing_after, :last_alert_at
  end
end