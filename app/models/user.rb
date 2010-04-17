class User < ActiveRecord::Base
  acts_as_authentic
  has_many :feeds, :dependent => :destroy
  has_many :domains, :dependent => :destroy
  has_many :alerts, :dependent => :destroy
  serialize :blacklist
  after_save :blacklist_purge, :if => :blacklist_changed?
  after_save :min_metric_purge, :if => :min_metric_changed?
  
  private

  def blacklist_purge
    Alert.find(:all).each do |alert|
      self.blacklist.each do |domain|
        if alert.url.match(/#{domain}/)
          Alert.destroy(alert)
          break
        end
      end
    end
  end
  
  def min_metric_purge
    Alert.find(:all).each {|alert| Alert.destroy(alert) if alert.metrics["fmrp"] < self.min_metric}
  end

  def blacklist_textarea
    (self.blacklist.nil?) ? "" : self.blacklist.join(",")
  end

end