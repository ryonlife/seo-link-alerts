class Alert < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :feeds
  has_and_belongs_to_many :domains
  after_create :alert_metrics_job
  serialize :metrics
  
  private
  
    def alert_metrics_job
      Delayed::Job.enqueue(AlertMetrics.new(self.id))
    end
  
end
