class AlertsController < ApplicationController
  before_filter :require_user
  
  def index
    @alerts = Alert.all({:order => 'created_at DESC'})
  end

  def destroy
    @alert = Alert.find(params[:id])
    @alert.destroy
    respond_to do |format|
      format.html { redirect_to alerts_url }
      format.js { render :nothing => true }
    end
  end
end