module AdminHelper
  #check to see if we're signed in
  #user info comes from oauth
  def signed_in?
    session[:user_info]
  end
  def admin_user?
    true
  end
  def deny_access
    redirect_to "/", :notice => "Please login before using admin."
  end
end
