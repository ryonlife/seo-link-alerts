class AddFiltersToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :min_mozrank, :float, :default => 3
    add_column :users, :blacklist, :text
  end

  def self.down
    remove_column :users, :min_mozrank
    remove_column :users, :blacklist
  end
end
