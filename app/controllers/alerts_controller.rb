class AlertsController < ApplicationController
  # GET /alerts
  # GET /alerts.xml
  def index
    @alerts = Alert.all({:order => 'created_at DESC'})
    # debugger
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
      format.html { redirect_to alerts_url }
      format.js { render :nothing => true }
    end
  end
end