class ParseCrawlJob < Struct.new(:feed_id, :domain, :url)  
  def perform
    # Crawl URL and parse for links to target domain (excluding nofollows), saving as alerts
    require 'open-uri'
    doc = Nokogiri::HTML(open(url))
    @links = []
    doc.xpath("//*[contains(@href, domain)]").each do |link|
      if link.attribute('rel').nil? || link.attribute('rel').text != 'nofollow'
        Alert.create(:feed_id => feed_id, :url => url, :title => doc.at_css('title').text)
        break
      end
    end    
  end
end