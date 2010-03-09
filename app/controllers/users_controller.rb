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
    blacklist = ''
    @user[:blacklist].to_array.each do |item|
      blacklist = blacklist + "\n" + item
      debugger
    end
    @user[:blacklist] = blacklist
  end
  
  def update
    @user = current_user
    blacklist = []
    params[:user][:blacklist].each do |line|
      blacklist << line.strip
    end
    params[:user][:blacklist] = blacklist.to_yaml
    if @user.update_attributes(params[:user]) then flash[:notice] = "Successfully updated user." end
    render :action => 'edit'
  end
end
