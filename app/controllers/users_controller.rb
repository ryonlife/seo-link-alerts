class UsersController < ApplicationController
  def new
    if current_user
      redirect_to :controller => 'alerts'
    else
      @user = User.new
    end
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "Registration successful."
      redirect_to :controller => 'feeds'
    else
      render :action => 'new'
    end
  end
  
  def edit
    require_user
    @user = current_user
  end
  
  def update
    @user = current_user
    if @user.update_attributes(params[:user]) then flash[:notice] = "Successfully updated user." end
    render :action => 'edit'
  end
end
