class ParseFeed < Struct.new(:feed_id)
  def perform
    feed = Feed.find(feed_id)
    save_begin_parsing_after = true
    freshest_timestamp = nil
    
    # Parse each feed and iterate entries
    parsed = Feedzirra::Feed.fetch_and_parse(feed.url, {
      :timeout => 10,
      :on_failure => lambda {raise "feedzirra failed"}
    })
    parsed.entries.each do |entry|
      
      # Add new entry URLs to crawl queue, stop looping when a previously parsed entry is hit
      break if entry.published <= feed.begin_parsing_after
      Delayed::Job.enqueue(ParseEntry.new(entry.url, feed.id))
      
      # Store timestamp of freshest feed entry
      if save_begin_parsing_after
        freshest_timestamp = entry.published
        save_begin_parsing_after = false
      end
    end
    
    # Update feed timestamp
    if freshest_timestamp.blank?
      feed.updated_at = Time.now
      feed.save
    else freshest_timestamp.blank?
      feed.begin_parsing_after = freshest_timestamp
      feed.save
    end

    Delayed::Job.enqueue(ParseFeed.new(feed.id), 0, 1.hour.from_now)
  end  
end