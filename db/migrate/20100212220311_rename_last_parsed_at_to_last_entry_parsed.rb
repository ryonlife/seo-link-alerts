class RenameLastParsedAtToLastEntryParsed < ActiveRecord::Migration
  def self.up
    rename_column :feeds, :last_parsed_at, :last_entry_parsed 
  end

  def self.down
    rename_column :feeds, :last_entry_parsed, :last_parsed_at
  end
end
