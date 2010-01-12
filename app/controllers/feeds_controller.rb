class FeedsController < ApplicationController
  
  # GET /feeds
  # GET /feeds.xml
  def index
    @feeds = Feed.find_all_by_user_id(current_user)
    
    @parsed_feeds = parse_feeds(@feeds)
    #debugger
    #@parsed_feeds = parse_feeds(@feeds)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @feeds }
    end
  end
  
  def parse_feeds(feeds)
    # urlpub[]
    feeds.inject([]){ |parsed, feed| parsed << Feedzirra::Feed.fetch_and_parse(feed.url) }
    # feeds.each do |feed|
    #   debugger
    #     feed.entries.each do |entry|
    #       urlpub[0] = entry.published
    #       urlpub[1] = entry.url
    #     end
    # end
    # urlpub
  end
  
  def queue_crawls(parsed_feeds)

  end

  # GET /feeds/1/edit
  def edit
    @feed = Feed.find(params[:id])
  end

  # POST /feeds
  # POST /feeds.xml
  def create
    @feed = current_user.feeds.build(params[:feed])

    respond_to do |format|
      if @feed.save
        flash[:notice] = 'Feed was successfully created.'
        format.html { redirect_to :feeds }
        format.xml  { render :xml => @feed, :status => :created, :location => @feed }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @feed.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /feeds/1
  # PUT /feeds/1.xml
  def update
    @feed = Feed.find(params[:id])

    respond_to do |format|
      if @feed.update_attributes(params[:feed])
        flash[:notice] = 'Feed was successfully updated.'
        format.html { redirect_to :feeds }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @feed.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /feeds/1
  # DELETE /feeds/1.xml
  def destroy
    @feed = Feed.find(params[:id])
    @feed.destroy

    respond_to do |format|
      format.html { redirect_to(feeds_url) }
      format.xml  { head :ok }
    end
  end
  
end
