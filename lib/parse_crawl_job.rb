class ParseCrawlJob < Struct.new(:feed_id, :domain, :url)  
  def perform
    require 'open-uri'
    doc = Nokogiri::HTML(open(url))
    @links = []
    doc.xpath("//*[contains(@href, domain)]").each do |link|
      if link.attribute('rel').nil? || link.attribute('rel').text != 'nofollow'
        Alert.create(:feed_id => feed.id, :url => entry.url, :title => doc.at_css('title').text)
      end
    end    
  end
end