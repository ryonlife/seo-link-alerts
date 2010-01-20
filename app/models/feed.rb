class Feed < ActiveRecord::Base
  belongs_to :user
  has_many :crawls, :dependent => :destroy 
  has_many :alerts, :dependent => :destroy
  
  after_save :parse_later
  
  # def self.parse_all_by_user_id(user_id)
  #   feeds = self.find_all_by_user_id(user_id)
  #   feeds.each do |feed|
  #     feed.parse
  #   end
  # end
  
  def parse_later
    self.send_later(:parse)
  end
  
  def parse
    save_last_parsed_at = true
    freshest_timestamp = ''
    
    # Parse each feed and iterate entries
    parsed = Feedzirra::Feed.fetch_and_parse(self.url)
    parsed.entries.each do |entry|
      
      # Add new entry URLs to crawl queue, stop looping when an old entry is hit
      break if entry.published < self.last_parsed_at
      if entry.published > self.last_parsed_at then
        crawls << Crawl.new(:url => entry.url)
      end
      
      # Store timestamp of freshest feed entry
      if save_last_parsed_at then
        freshest_timestamp = entry.published
        save_last_parsed_at = false
      end
    end
    
    # Update feed timestamp
    unless freshest_timestamp.blank?
      self.last_parsed_at = freshest_timestamp
      self.save
    end
    
    self.send_later(:parse, 0, 1.hour.from_now)
  end 
  
end