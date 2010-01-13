class CreateFeeds < ActiveRecord::Migration
  def self.up
    create_table :feeds do |t|
      t.integer :user_id
      t.string :feed, :unique => true
      t.string :domain

      t.timestamps
    end
  end

  def self.down
    drop_table :feeds
  end
end
