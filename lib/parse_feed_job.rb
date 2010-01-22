class ParseFeedJob < Struct.new(:feed_id)
    
  def perform
    feed = Feed.find(feed_id)
    
    save_last_parsed_at = true
    freshest_timestamp = ''
    
    # Parse each feed and iterate entries
    parsed = Feedzirra::Feed.fetch_and_parse(feed.url)
    parsed.entries.each do |entry|
      
      # Add new entry URLs to crawl queue, stop looping when an old entry is hit
      break if entry.published < feed.last_parsed_at
      # if entry.published > feed.last_parsed_at then
      #   crawls << Crawl.new(:url => entry.url)
      # end
      
      # Store timestamp of freshest feed entry
      if save_last_parsed_at then
        freshest_timestamp = entry.published
        save_last_parsed_at = false
      end
    end
    
    # Update feed timestamp
    unless freshest_timestamp.blank?
      feed.last_parsed_at = freshest_timestamp
      feed.save
    end
    
    Delayed::Job.enqueue(ParseFeedJob.new(feed.id), 3, 3.days.from_now)
  end  
end