class DropFeedIdFromAlerts < ActiveRecord::Migration
  def self.up
    remove_column :alerts, :feed_id
  end

  def self.down
    add_column :alerts, :feed_id, :integer
  end
end
