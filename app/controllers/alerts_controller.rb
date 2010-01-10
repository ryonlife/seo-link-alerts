class AlertsController < ApplicationController
  # GET /alerts
  # GET /alerts.xml
  def index
    @alerts = Alert.all

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
