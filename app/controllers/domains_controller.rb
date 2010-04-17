class DomainsController < ApplicationController
  before_filter :require_user
  
  def index
    @domains = Domain.find_all_by_user_id(current_user, :order => "last_alert_at DESC")
  end

  def new
    @domain = Domain.new
  end

  def create
    @domain = current_user.domains.build(params[:domain])
    if @domain.save
      flash[:notice] = "Domain was successfully created."
      redirect_to :domains
    else
      render :action => :new
    end
  end

  def destroy
    @domain = Domain.find_by_id(params[:id], :conditions => "user_id = #{current_user.id}")
    @domain.destroy
    respond_to do |format|
      format.html { redirect_to domains_url }
      format.js { render :nothing => true }
    end    
  end
end
