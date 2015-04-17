class UserController < ApplicationController
  layout 'user'

  #call function before action, verify login

  before_action :login_redirect_logic, :only=>[:list,:edit,:delete,:update]  #:except=>[:login,:logout,:auth,:signup, :index]

  #TODO redirect based on normal user(status=1) or admin(status=0)
  def index
    if is_logged_in
      redirect_to(:action=>'list')
    end
    #all logic in login_redirect_logic
  end

  def login


  end
  def auth
    if params[:username].present? && params[:password].present?
      found_user = User.where(:username=>params[:username]).first
      if found_user
        #encrypt the password to compare with database.  (method in gem)
        # return user obj or false
        authorized_user = found_user.authenticate(params[:password])
      end
    end
    if authorized_user
      #mark user login
      session[:user_id]  = authorized_user.id
      session[:username] = authorized_user.username
      flash[:notice] = "You are now logged in."
      redirect_to(:action=>'index')
    else
      flash[:notice] = "Invalid username of password"
      redirect_to(:action=>'login')
    end
  end

  def logout
    session[:user_id]  = nil
    session[:username] = nil
    flash[:notice] ="Logged out"
    redirect_to(:action => 'login')
  end


  def signup
    @user = User.new() # {:name=>"username"} # default value
  end

  def create
   # @user = params[:user]  # need whitelist to make mass assignment
    @user = User.new(user_params)
    #create new user
    if @user.save
      session[:user_id]  = @user.id
      session[:username] = @user.username
      flash[:notice] = "User '#{@user.username}' created successfully."
      redirect_to(:action=>'index')
      #redirect_to(:action => 'auth', :username=>@user.username, :password=>@user.password)
    else
      render('signup')   # sign up will receive @user and auto fill form again
    end
  end

  #list all users.  TODO pagination.
  def list
    logger.debug "Processing the list..."
    @users = User.all.order('updated_at desc') #where(:status=>1)
  end

  # edit user info
  def edit
    @user = User.find(params[:id])   #id from list 'edit' anchor
  end
  # update user info(save edited to database)
  def update
    # @user = params[:user]  # need whitelist to make mass assignment
    @user =  User.find(params[:id])

    #create new user
    if @user!=nil && @user.update_attributes(user_params)
      flash[:notice] = "User '#{@user.username}' updated successfully."
      redirect_to(:action => 'list')
    else
      render('edit')   # sign up will receive @user and auto fill form again
    end
  end

  #remove user from db
  def delete
    @user = User.find(params[:id])
    @user.destroy if @user!=nil  # TODO maybe set status to 0 as deleted instead of removing entry
    flash[:notice] = "User '#{@user.username}' deleted successfully."

    # when admin delete himself
    if session[:user_id]== @user.id
      session[:user_id] = nil
      session[:username] = nil
    end
    redirect_to(:action => 'list')
  end

  private
    # whitelist params for submitted :user from form to assign to @user
    def user_params
      #same as using "params[:user]" except that it
      # - raises error if :user is not present
      # - allow listed attributes to be mass assigned
      params.require(:user).permit(:username, :password, :password_confirmation,:email, :usertype)
    end


=begin
    if admin in=> list user
    if normal in => list secrets
    if not in=>login page
=end
    def login_redirect_logic
      logger.info "Processing the is_admin..."
      if session[:user_id] && User.find(session[:user_id]).usertype == 1   # admin login
        logger.info "Processing the is_admin... '#{ User.find(session[:user_id]).usertype == 1}'"
       # redirect_to(:action=>"list")
        return true
      elsif session[:user_id]  #normal user login
        redirect_to(:controller=>'secret', :action=>'list')
        return true
      else  #not login
        flash[:notice] = "You do not have access to see this page"
        redirect_to(:action=>"login")
        return false
      end
    end
end
