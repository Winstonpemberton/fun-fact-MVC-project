module Helper

# checks to see if the user is logged in
  def logged_in?
    !!session[:id]
  end

# checks to see if who the current user is
  def current_user
    @current_user ||= User.find(session[:id]) if session[:id]
  end
# used to validate login credentials
  def login(username, password)
    user = User.find_by(:username => username)
    if user && user.authenticate(password)
      session[:id] = user.id
    end
  end

  def logout!
    session.clear
  end
end
