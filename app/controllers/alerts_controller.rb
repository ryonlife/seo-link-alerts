class AlertsController < ApplicationController
  # GET /alerts
  # GET /alerts.xml
  def index
    @alerts = Alert.all
    
    require 'open-uri'
    url = 'http://mashable.com/2010/01/17/social-media-political-impact/'
    url = 'http://www.killerstartups.com/Social-Networking/socialsitecreator-com-have-a-social-site-of-your-own'
    doc = Nokogiri::HTML(open(url))
    @links = []
    doc.xpath("//*[contains(@href, 'socialsitecreator.com')]").each do |link|
      if link.attribute('rel').nil? || link.attribute('rel').text != 'nofollow'
        @links << doc.at_css('title').text
      end
    end

    #require 'feedzirra'
    #@rss = Feedzirra::Feed.fetch_and_parse('http://feeds.feedburner.com/PaulDixExplainsNothing')

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @alerts }
    end
  end

  # DELETE /alerts/1
  # DELETE /alerts/1.xml
  def destroy
    @alert = Alert.find(params[:id])
    @alert.destroy

    respond_to do |format|
      format.html { redirect_to(alerts_url) }
      format.xml  { head :ok }
    end
  end
end