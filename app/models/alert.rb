class Alert < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :feeds
  has_and_belongs_to_many :domains
  after_create :alert_metrics_job
  serialize :metrics
  before_save :check_blacklist
  after_save :check_metric, :if => :metrics_changed?
  
  private

  def check_blacklist
    User.find(self.user_id).blacklist.each {|domain| return false if self.url.match(/#{domain}/)}
  end
  
  def check_metric
    Alert.destroy(self) if !self.metrics.nil? && User.find(self.user_id).min_metric > self.metrics["fmrp"]
  end
  
  def alert_metrics_job
    Delayed::Job.enqueue(AlertMetrics.new(self.id))
  end
  
end
