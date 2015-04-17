class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def is_admin(id)
    return id && User.find(id).usertype==1
  end
  def is_logged_in
    return session[:user_id]
  end
end
