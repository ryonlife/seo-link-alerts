class UserSessionsController < ApplicationController
  def new
    if current_user
      redirect_to :controller => "alerts"
    else
      @user_session = UserSession.new
    end
  end
  
  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      flash[:notice] = "Successfully logged in."
      redirect_to :controller => "alerts"
    else
      render :action => "new"
    end
  end
  
  def destroy
    @user_session = UserSession.find
    @user_session.destroy
    flash[:notice] = "Successfully logged out."
    redirect_to :login
  end
end