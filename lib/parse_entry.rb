class ParseEntry < Struct.new(:url, :feed_id)  
  def perform
    require 'open-uri'
    doc = Nokogiri::HTML(open(url))
    Domain.all.each do |d|
      doc.xpath("//a[contains(@href, '#{d.name}')]").each do |link|
        if link.attribute('rel').nil? || link.attribute('rel').text != 'nofollow'
          alert = Alert.find_by_url(url)
          domain = Domain.find_by_id(d.id)
          feed = Feed.find_by_id(feed_id)
          if alert
            alert.domains << domain unless already_joined?(alert.domains, d.id)
            alert.feeds << feed unless already_joined?(alert.feeds, feed_id)
          else
            alert = Alert.new(:url => url, :title => doc.at_css('title').text)
            alert.domains = [domain]
            alert.feeds = [feed]
          end
          alert.save
          break
        end
      end
    end
  end
  
  def already_joined?(obj, id)
    already_joined = false
    obj.each do |o|
      if o.id == id then already_joined = true end
    end
    already_joined
  end
end