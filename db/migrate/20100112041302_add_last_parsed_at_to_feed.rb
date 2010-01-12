class AddLastParsedAtToFeed < ActiveRecord::Migration
  def self.up
    add_column :feeds, :last_parsed_at, :datetime
  end

  def self.down
    remove_column :feeds, :last_parsed_at
  end
end
