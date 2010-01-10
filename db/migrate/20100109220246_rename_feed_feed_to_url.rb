class RenameFeedFeedToUrl < ActiveRecord::Migration
  def self.up
    rename_column :feeds, :feed, :url 
  end

  def self.down
    rename_column :feeds, :url, :feed
  end
end
