class ChangeAlertMetricsToText < ActiveRecord::Migration
  def self.up
    change_column :alerts, :metrics, :text, :limit => 1000
  end

  def self.down
    change_column :alerts, :metrics, :string, :limit => 255
  end
end
