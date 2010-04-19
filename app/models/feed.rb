class Feed < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :alerts
  before_create :get_name
  after_create :parse_feed_job
  
  private
  
  def get_name
    feed = Feedzirra::Feed.fetch_and_parse(self.url)
    self.name = feed.title[16, feed.title.length - 16]
    false if self.name.nil?
  end

  def parse_feed_job
    Delayed::Job.enqueue(ParseFeed.new(self.id))
  end

end