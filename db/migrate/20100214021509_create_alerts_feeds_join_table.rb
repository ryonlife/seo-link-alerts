class CreateAlertsFeedsJoinTable < ActiveRecord::Migration
  def self.up
    create_table :alerts_feeds, :id => false do |t|
      t.integer :alert_id
      t.integer :feed_id
    end
  end

  def self.down
    drop_table :alerts_feeds
  end
end