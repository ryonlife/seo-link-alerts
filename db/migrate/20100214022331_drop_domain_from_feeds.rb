class DropDomainFromFeeds < ActiveRecord::Migration
  def self.up
    remove_column :feeds, :domain
  end

  def self.down
    add_column :feeds, :domain, :string
  end
end
