class CreateAlerts < ActiveRecord::Migration
  def self.up
    create_table :alerts do |t|
      t.integer :feed_id
      t.string :url
      t.string :title
      t.string :metrics
      t.timestamps
    end
  end

  def self.down
    drop_table :alerts
  end
end
