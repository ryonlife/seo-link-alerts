class CreateAlertsDomainsJoinTable < ActiveRecord::Migration
  def self.up
    create_table :alerts_domains, :id => false do |t|
      t.integer :alert_id
      t.integer :domain_id
    end
  end

  def self.down
    drop_table :alerts_domains
  end
end
