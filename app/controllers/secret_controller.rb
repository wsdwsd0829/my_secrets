class SecretController < ApplicationController
  layout 'secret'
  before_action :check_login
  #pass in user id as :id
  def list
    #only admin can use Get request to see other's info
    if is_admin(session[:user_id])
      #if User.find(session[:user_id]).usertype==1
      @user_id=params[:user_id] || session[:user_id]   # if not others find him self's secrets
    else
      @user_id=session[:user_id];
    end
    @secrets = Secret.where(:user_id=>@user_id).order('updated_at desc')  #params[:userid]
  end
  def view

  end


  def new
    @user_id = params[:user_id]
    @secret = Secret.new()
  end
  def create
# @user = params[:user]  # need whitelist to make mass assignment
    @secret = Secret.new(secret_params)
    @secret.user_id = params[:user_id]  # TODO change to hidden field
    #create new user
    if @secret.save
      flash[:notice] = "Secret '#{@secret.title}' created successfully."
      redirect_to(:action => 'list',:user_id=> params[:user_id] )   # user_id from new   #TODO replace with session var
    else
      render('new')   # sign up will receive @user and auto fill form again
    end
  end


  def edit
    @user_id = params[:user_id]
    @secret = Secret.find(params[:id])   #id from list 'edit' anchor
  end
  def update
    # @secret = params[:secret]  # need whitelist to make mass assignment
    @user_id= params[:user_id]
    @secret =  Secret.find(params[:id])

    #update secret
    if @secret.update_attributes(secret_params)
      flash[:notice] = "Secret '#{@secret.title}' updated successfully."
      redirect_to(:action => 'list',:user_id=> @user_id)
    else
      render('edit')   # sign up will receive @user and auto fill form again
    end
  end

  def delete
    @secret = Secret.find(params[:id])    #TODO check token to verify is owner  or check for action list before action.
    @secret.destroy if @secret != nil
    flash[:notice] = "Secret '#{@secret.title}' deleted successfully."

    redirect_to(:action=>"list", :user_id => params[:user_id]);   # TODO if list in url check user or login
  end

end


private
  # whitelist params for submitted :secret from form to assign to @secret
  def secret_params
    #same as using "params[:secret]" except that it
    # - raises error if :user is not present
    # - allow listed attributes to be mass assigned
    params.require(:secret).permit(:user_id, :title, :content, :publish)
  end

#notes
=begin
flash for redirect, only save for one more request
=end
  def check_login
    logger.info "checking login in secrets"
    unless session[:user_id]
      flash[:notice] = "No access to peform the action"
      redirect_to controller:'user', action:'login'
      return false
    end
    return true
  end