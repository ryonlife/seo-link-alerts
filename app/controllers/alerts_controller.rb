class AlertsController < ApplicationController
  before_filter :require_user
  
  def index
    @alerts = Alert.find_all_by_user_id(current_user.id, :order => "created_at DESC")
  end

  def destroy
    @alert = Alert.find_by_id(params[:id], :conditions => "user_id = #{current_user.id}")
    @alert.destroy
    respond_to do |format|
      format.html { redirect_to alerts_url }
      format.js { render :nothing => true }
    end
  end
end