class FeedAddDefaultToBeginParsingAfter < ActiveRecord::Migration
  def self.up
    change_column :feeds, :begin_parsing_after, :datetime, :default => 0
  end

  def self.down
    change_column :feeds, :begin_parsing_after, :datetime, :default => nil
  end
end
