class AddLastParsedAtToFeed < ActiveRecord::Migration
  def self.up
    add_column :feeds, :last_parsed_at, :datetime, :default => Time.now - 10.years
  end

  def self.down
    remove_column :feeds, :last_parsed_at
  end
end
