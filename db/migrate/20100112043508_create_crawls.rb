class CreateCrawls < ActiveRecord::Migration
  def self.up
    create_table :crawls do |t|
      t.integer :feed_id
      t.string :url
      t.datetime :last_attempted_at, :default => Time.now - 10.years
      t.timestamps
    end
  end

  def self.down
    drop_table :crawls
  end
end
