class Feed < ActiveRecord::Base
  belongs_to :user
  has_many :crawls, :dependent => :destroy 
  has_many :alerts, :dependent => :destroy
  
  after_create :parse_feed_job
  
  private
  
    def parse_feed_job
      Delayed::Job.enqueue(ParseFeed.new(self.id))
    end

end