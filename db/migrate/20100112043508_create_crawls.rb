class CreateCrawls < ActiveRecord::Migration
  def self.up
    create_table :crawls do |t|
      t.integer :feed_id
      t.string :url
      t.datetime :last_attempted_at
      t.timestamps
    end
  end

  def self.down
    drop_table :crawls
  end
end
