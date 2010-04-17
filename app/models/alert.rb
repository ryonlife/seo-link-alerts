class Alert < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :feeds
  has_and_belongs_to_many :domains
  after_create :alert_metrics_job
  serialize :metrics
  before_save :check_blacklist
  before_save :check_metric
  
  private

  def check_blacklist
    current_user.blacklist.each {|domain| return false if self.url.match(/#{domain}/)}
  end
  
  def check_metric
    false if self.metrics["fmrp"] >= current_user.min_metric
  end
  
  def alert_metrics_job
    Delayed::Job.enqueue(AlertMetrics.new(self.id))
  end
  
end
