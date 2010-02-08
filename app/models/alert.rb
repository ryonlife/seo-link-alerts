class Alert < ActiveRecord::Base
  belongs_to :feed
  after_create :alert_metrics_job
  serialize :metrics
  
  private
  
    def alert_metrics_job
      Delayed::Job.enqueue(AlertMetrics.new(self.id))
    end
  
end
