class Feed < ActiveRecord::Base
  belongs_to :user
  has_many :crawls, :dependent => :destroy 
  has_many :alerts, :dependent => :destroy
  
  after_create :parse_later
  
  def parse_later
    Delayed::Job.enqueue(ParseFeedJob.new(self.id))
  end
  
end