class Feed < ActiveRecord::Base
  belongs_to :user
  has_many :crawls, :dependent => :destroy 
  has_many :alerts, :dependent => :destroy 
  
  def self.parse_all_by_user_id(user_id)
    feeds = self.find_all_by_user_id(user_id)
    feeds.each do |feed|
      feed.parse
    end
  end
  
  def parse
    parsed = Feedzirra::Feed.fetch_and_parse(self.url)
    parsed.entries.each do |entry|
      crawls << Crawl.new(:url => entry.url)
    end
  end 
  
  # before_save :add_user_id
  # def add_user_id
  #   self.user_id = current_user
  # end

end
