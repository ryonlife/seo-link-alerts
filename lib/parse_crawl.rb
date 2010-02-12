class ParseCrawl < Struct.new(:feed_id, :domain, :url)  
  def perform
    # Crawl URL and parse for followed links to target domain, saving as alerts
    require 'open-uri'
    # doc = nil
    # begin
    #   doc = open(url)
    # rescue OpenURI::Error => error
    #   # error.io.status[0] # => 3xx, 4xx, or 5xx
    #   raise "The request for a page at #{url} returned an error. #{error.message}"
    # end
    # doc = Nokogiri::HTML(doc)
    Rails.logger.info "Crawling #{url} for //a[contains(@href, '#{domain}')]"
    doc = Nokogiri::HTML(open(url))
    @links = []
    doc.xpath("//a[contains(@href, '#{domain}')]").each do |link|
      if link.attribute('rel').nil? || link.attribute('rel').text != 'nofollow'
        alert = Alert.create(:feed_id => feed_id, :url => url, :title => doc.at_css('title').text)
        break
      end
    end
  end
end