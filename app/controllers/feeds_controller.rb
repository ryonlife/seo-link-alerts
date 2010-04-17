class FeedsController < ApplicationController
  before_filter :require_user
  
  def index
    @feeds = Feed.find_all_by_user_id(current_user.id, :order => "begin_parsing_after DESC")
  end
  
  def new
    if Domain.find_all_by_user_id(current_user.id).length == 0
      flash[:notice] = "Add at least one domain before adding a feed."
      redirect_to :controller => "domains", :action => "new"
    else
      @feed = Feed.new   
    end
  end  

  def create
    @feed = current_user.feeds.build(params[:feed])
    if @feed.save
      flash[:notice] = "Feed was successfully created."
      redirect_to :feeds
    else
      render :action => "new"
    end
  end

  def destroy
    @feed = Feed.find_by_id(params[:id], :conditions => "user_id = #{current_user.id}")
    @feed.destroy
    respond_to do |format|
      format.html { redirect_to feeds_url }
      format.js { render :nothing => true }
    end    
  end
  
end
