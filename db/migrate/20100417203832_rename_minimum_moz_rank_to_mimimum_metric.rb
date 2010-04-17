class RenameMinimumMozRankToMimimumMetric < ActiveRecord::Migration
  def self.up
    rename_column :users, :min_mozrank, :min_metric 
  end

  def self.down
    rename_column :users, :min_metric, :min_mozrank
  end
end
